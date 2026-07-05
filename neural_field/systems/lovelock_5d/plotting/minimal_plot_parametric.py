import argparse
import sys
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import torch
import scienceplots
import matplotlib as mpl

#["science", "no-latex"]
plt.style.use("science")

mpl.rcParams.update({
    "text.usetex": True,
    "font.family": "serif",
    "font.serif": ["Computer Modern Roman"],
    "mathtext.fontset": "cm",

    "font.size": 10,
    "axes.labelsize": 10,
    "axes.titlesize": 10,
    "legend.fontsize": 8,
    "xtick.labelsize": 8,
    "ytick.labelsize": 8,
})
# =====================================================================
# Repository root path (dynamically resolved)
# =====================================================================
import sys
# Resolve the repository root dynamically (4 levels up from this script)
REPO_ROOT = Path(__file__).resolve().parents[5] / "difflearning"

if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))
    
from utils import loader
from utils.lightning_module import PINNModule


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--version_dir", type=Path, required=True)
    parser.add_argument("--ref_path", type=Path, default=None)
    parser.add_argument("--output_dir", type=Path, default=None)
    parser.add_argument("--r_min", type=float, default=None)
    parser.add_argument("--r_max", type=float, default=None)
    parser.add_argument("--alph_min", type=float, default=0.0)
    parser.add_argument("--alph_max", type=float, default=3.0)
    parser.add_argument("--alph_step", type=float, default=0.3)
    parser.add_argument("--n_x", type=int, default=500)
    return parser.parse_args()


def load_reference_csv(ref_path: Path, target_x: np.ndarray, rh: float):
    """Load reference data from a CSV file and interpolate it to the target x values."""
    if not ref_path or not ref_path.exists():
        return None
    df = pd.read_csv(ref_path)
    if not all(c in df.columns for c in ["r", "f(r)", "b(r)", "H(r)", "w(r)"]):
        return None
        
    r_csv = df["r"].to_numpy(dtype=np.float64)
    f_csv = df["f(r)"].to_numpy(dtype=np.float64)
    b_csv = df["b(r)"].to_numpy(dtype=np.float64)
    h_csv = df["H(r)"].to_numpy(dtype=np.float64)
    w_csv = df["w(r)"].to_numpy(dtype= np.float64)
    
    x_csv = np.arctan(r_csv - rh)
    sinx, cosx = np.sin(x_csv), np.cos(x_csv)
    
    with np.errstate(divide="ignore", invalid="ignore"):
        F_csv = (f_csv / sinx - 1.0) / (cosx ** 2)
        B_csv = (b_csv / sinx - 1.0) / (cosx ** 2)
        H_csv = ((r_csv ** 2) * (h_csv - 1.0)) / (cosx ** 2)
        W_csv = w_csv / (cosx ** 4)

    def interp(y): 
    
        finite = np.isfinite(x_csv) & np.isfinite(y)
        if not np.any(finite): return np.full_like(target_x, np.nan)
        xs, ys = x_csv[finite], y[finite]
        order = np.argsort(xs)
        return np.interp(target_x, xs[order], ys[order], left=np.nan, right=np.nan)
    
    return {
        "f": interp(f_csv), "b": interp(b_csv), "h": interp(h_csv), "w": interp(w_csv),
        "F": interp(F_csv), "B": interp(B_csv), "H": interp(H_csv), "W": interp(W_csv)
    }


def build_runtime_conf(module: PINNModule) -> dict:
    conf = dict(module.conf) if isinstance(module.conf, dict) else {}
    trainable = getattr(module, "trainable_params", None)
    if trainable is not None:
        for name, value in trainable.items():
            if isinstance(value, torch.Tensor):
                conf[name] = (
                    float(value.detach().cpu().item())
                    if value.numel() == 1
                    else value.detach().cpu()
                )
            else:
                conf[name] = value
    return conf


def infer_input_dim(model) -> int:
    if hasattr(model, "base_net") and hasattr(model, "residual_net"):
        return infer_input_dim(model.base_net)

    for submodule in model.modules():
        if isinstance(submodule, torch.nn.Linear):
            return submodule.in_features

    raise RuntimeError(f"Could not infer input dimension for {type(model)!r}")


def build_model_input(model, points_coord: dict) -> torch.Tensor:
    in_dim = infer_input_dim(model)
    if in_dim == 1:
        if "alph" in points_coord:
            return points_coord["alph"]
        first_coord = points_coord["coord_order"][0]
        return points_coord[first_coord]

    coord_names = list(points_coord["coord_order"])
    return torch.cat([points_coord[name] for name in coord_names[:in_dim]], dim=1)


def eval_parametric_models(models, points_coord: dict) -> dict:
    models_evaled = {}
    for net_name, info in models.items():
        model = info["net"]
        model_input = build_model_input(model, points_coord)
        model_evaled = model(model_input)
        for func, channel in info["outputs"].items():
            models_evaled[func] = model_evaled[:, channel].unsqueeze(1)
    return models_evaled


def eval_parametric_exact(exact_funcs, points_coord: dict, conf: dict) -> dict:
    return exact_funcs(points_coord, conf)


def make_points_coord(x_vals: torch.Tensor, alph_value: float, device, dtype) -> dict:
    alph_vals = torch.full_like(x_vals, float(alph_value), device=device, dtype=dtype)
    return {
        "x": x_vals,
        "alph": alph_vals,
        "coord_order": ["x", "alph"],
    }


def alpha_grid(alph_min: float, alph_max: float, alph_step: float) -> np.ndarray:
    if alph_step <= 0:
        raise ValueError("alph_step must be positive")
    values = np.arange(alph_min, alph_max + 0.5 * alph_step, alph_step, dtype=np.float64)
    if values.size == 0:
        raise ValueError("alpha grid is empty")
    values[-1] = min(values[-1], alph_max)
    return np.unique(np.round(values, 12))


# Reemplaza tu función actual por esta:
def select_x_interval(exp_root: Path, ckpt: dict):
    lo, hi = 0.0, 1.5707
    try:
        domain_path = exp_root / ckpt["datamodule_hyper_parameters"]["domain_path"]
        lo, hi = loader.load_spec(domain_path)["space"]["x"]["interval"]
    except Exception:
        pass
    
    return lo, hi


def to_np(value):
    if isinstance(value, torch.Tensor):
        return value.detach().cpu().numpy().reshape(-1)
    return np.asarray(value)


def truncated_cmap(name: str, minval: float = 0.0, maxval: float = 0.82, n: int = 256):
    base_cmap = plt.colormaps[name]
    samples = np.linspace(minval, maxval, n)
    return plt.matplotlib.colors.LinearSegmentedColormap.from_list(
        f"{name}_truncated",
        base_cmap(samples),
    )


def physical_from_eval(eval_dict: dict, x_vals: np.ndarray, rh: float) -> dict:
    r_ts = np.tan(x_vals) + rh
    sinx, cosx = np.sin(x_vals), np.cos(x_vals)

    phys = {}
    if "F" in eval_dict:
        phys["f"] = (eval_dict["F"] * cosx**2 + 1.0) * sinx
    elif "f" in eval_dict:
        phys["f"] = eval_dict["f"]

    if "B" in eval_dict:
        phys["b"] = -((eval_dict["B"] * cosx**2 + 1.0) * sinx)
    elif "b" in eval_dict:
        phys["b"] = -eval_dict["b"]

    if "H" in eval_dict:
        phys["h"] = (r_ts**2 + eval_dict["H"] * cosx**2) / r_ts**2
    elif "h" in eval_dict:
        phys["h"] = eval_dict["h"]

    if "W" in eval_dict:
        phys["w"] = (cosx**4) * eval_dict["W"]
    elif "w" in eval_dict:
        phys["w"] = eval_dict["w"]

    return {key: to_np(value) for key, value in phys.items()}


def scalar_from_eval(eval_dict: dict, key: str):
    if key not in eval_dict:
        return None
    values = np.asarray(eval_dict[key], dtype=np.float64).reshape(-1)
    if values.size == 0:
        return None
    return float(np.nanmean(values))


def exact_c0_value(rh: float) -> float:
    omega = 0.33
    return float(4 * omega * rh**4 / (omega**2 * rh**2 - 1))


def plot_parametric_family(
    out_path: Path,
    x_np: np.ndarray,
    alpha_values: np.ndarray,
    model_by_alpha: dict,
    exact_data: dict,
    value_keys: list,
    title: str = None,
    x_label: str = None,
    y_label: str = None,
    ref_data: dict = None,
    text_positions: dict = None,
    xlim: tuple = None,
):
    fig, ax = plt.subplots(figsize=(11.5, 6.5))
    norm = plt.Normalize(alpha_values.min(), alpha_values.max())
    key_cmaps = {
        "f": truncated_cmap("Blues_r", 0.4, 0.82),
        "b": truncated_cmap("Greens_r", 0.4, 0.82),
        "h": truncated_cmap("Oranges_r", 0.4, 0.82),
        "w": truncated_cmap("Reds_r", 0.4, 0.82),
    }
    exact_colors = {
        "f": "#155a96",
        "b": "#1f7a1f",
        "h": "#d95f02",
        "w": "#b22222",
    }
    ref_colors = {
        "f": "#17becf",
        "b": "#98df8a",
        "h": "#ffbb78",
        "w": "#ff9896",
    }
    label = r"Exact ($\alpha = 0$)" 
    label_model = r"Neural Field Model"
    if xlim is not None:
        left = xlim[0] if xlim[0] is not None else ax.get_xlim()[0]
        right = xlim[1] if xlim[1] is not None else ax.get_xlim()[1]
        ax.set_xlim(left=left, right=right)
    if text_positions:
        for key in value_keys:
            if key in text_positions:
                x_pos, y_pos, label_string = text_positions[key]
                ax.text(
                    x_pos, 
                    y_pos, 
                    label_string, 
                    fontsize=12, 
                    color="black",
                    ha="center", 
                    va="center", 
                )

    exact_labeled = False
    model_labeled = False
    if ref_data:
        ref_labeled = False
    for key in value_keys:
        cmap = key_cmaps.get(key, truncated_cmap("Greys_r", 0.08, 0.92))
        for alpha_value in alpha_values:
            color = cmap(norm(alpha_value))
            if key in model_by_alpha[alpha_value]:
                ax.plot(
                    x_np,
                    model_by_alpha[alpha_value][key],
                    color=color,
                    lw=1.15,
                    ls= "-",
                    alpha=1.0,
                    label=label_model if not model_labeled else None,
                )
                model_labeled = True
        if key in exact_data:
            ax.plot(
                x_np,
                exact_data[key],
                color=exact_colors.get(key, "red"),
                lw=1.5,
                ls=(0, (1, 0.3)),
                alpha=1.0,
                label=label if not exact_labeled else None,
            )
            exact_labeled = True
        if ref_data:
            if key in ref_data:
                y_vals = -ref_data[key] if key == "b" else ref_data[key]
                ax.plot(
                    x_np,
                    y_vals,
                    color=ref_colors.get(key, "goldenrod"),
                    lw=1.5,
                    ls="--",
                    alpha=1.0,
                    label=r"Numeric ($\alpha = 3$)" if not ref_labeled else None,
                )
                ref_labeled = True

    if title is not None:
        ax.set_title(title)
    if x_label is not None:
        ax.set_xlabel(x_label)
    if y_label is not None:
        ax.set_ylabel(y_label)

    ax.grid(True, alpha=0.3)
    legend = ax.legend(ncol=3, fontsize=9, loc="best")
    if legend is not None:
        for text in legend.get_texts():
            text.set_color("black")
        legend_lines = legend.get_lines()
        for line in legend_lines:
            line.set_color("black")
            line.set_alpha(0.9)
        if legend_lines:
            legend_lines[0].set_color("#9a9a9a")
            legend_lines[0].set_alpha(0.6)
            legend_lines[0].set_linewidth(2.0)

    fig.subplots_adjust(right=0.86)
    cax = fig.add_axes([0.87, 0.16, 0.012, 0.68])
    shared_cmap = truncated_cmap("Greys_r", 0.15, 0.92)
    sm = plt.cm.ScalarMappable(norm=norm, cmap=shared_cmap)
    sm.set_array([])
    cbar = fig.colorbar(sm, cax=cax)
    cbar.outline.set_linewidth(0.6)
    cbar.set_label(r"$\alpha$", fontsize=10, labelpad=3, rotation=0)
    cbar.ax.set_title('NN', pad=5, fontsize=9)
    tick_values = np.asarray(alpha_values, dtype=np.float64)
    if tick_values.size > 8:
        tick_values = np.unique(np.round(np.linspace(alpha_values.min(), alpha_values.max(), 6), 12))
    cbar.set_ticks(tick_values)
    cbar.ax.set_yticklabels([f"{value:.1f}" for value in tick_values])

    fig.savefig(out_path, dpi=200)
    plt.close(fig)


def plot_scalar_vs_alpha(
    out_path: Path, 
    alpha_values: np.ndarray, 
    model_scalar: np.ndarray, 
    exact_scalar: float, 
    scalar_name: str
):
    fig, ax = plt.subplots(figsize=(9.5, 5.5))
    ax.plot(alpha_values, model_scalar, color="#c85c00", lw=2.2, marker="o", ms=4, label=f"{scalar_name} model")
    ax.axhline(exact_scalar, color="black", lw=1.8, ls="--", label=f"{scalar_name} exact")
    ax.set_xlabel(r"$\alpha$")
    ax.set_ylabel(scalar_name)
    ax.set_title(f"EGB parametric: {scalar_name} vs alpha")
    ax.grid(True, alpha=0.3)
    ax.legend(frameon=False)
    fig.tight_layout()
    fig.savefig(out_path, dpi=200)
    plt.close(fig)

def main():
    args = parse_args()
    out_dir = args.output_dir or (args.version_dir / "plots_parametric")
    out_dir.mkdir(parents=True, exist_ok=True)

    ckpt_path = sorted((args.version_dir / "checkpoints").glob("*.ckpt"))[-1]
    ckpt = torch.load(ckpt_path, map_location="cpu")
    hp = ckpt["hyper_parameters"]

    trainable_params = hp.get("trainable_params", {})
    if not trainable_params:
        for key, value in ckpt.get("state_dict", {}).items():
            if key.startswith("trainable_params."):
                trainable_params[key.split(".", 1)[1]] = float(value.detach().cpu().item())

    exp_root = args.version_dir.parents[5].resolve()

    module = PINNModule(
        build_spec_path=str(hp["build_spec_path"]),
        experiment_root=str(exp_root),
        tool=hp.get("tool", "mimic"),
        exact_path=str(hp.get("exact_path", "")),
        conf=hp.get("conf", {}),
        trainable_params=trainable_params,
    )
    module.load_state_dict(ckpt["state_dict"], strict=True)
    module.eval()

    rh = module.conf.get("rh", 1.0)
    plot_lo, plot_hi = select_x_interval(exp_root, ckpt)
    x_vals = torch.linspace(plot_lo + 1e-6, plot_hi - 1e-6, args.n_x).unsqueeze(1)
    x_np = x_vals.detach().cpu().numpy().reshape(-1)


    ref_data = load_reference_csv(args.ref_path, x_np, rh) or {}

    conf_runtime = build_runtime_conf(module)
    exact_funcs = loader.module_from_path(module.hparams.exact_path).exact_functions
    device = next(module.parameters()).device
    dtype = next(module.parameters()).dtype

    alpha_values = alpha_grid(args.alph_min, args.alph_max, args.alph_step)

    model_by_alpha = {}
    x_vals_device = x_vals.to(device=device, dtype=dtype)
    points_coord_exact = make_points_coord(x_vals_device, 0.0, device, dtype)
    exact_eval = eval_parametric_exact(exact_funcs, points_coord_exact, conf_runtime)
    exact_data = {key: to_np(value) for key, value in exact_eval.items()}
    
    for alpha_value in alpha_values:
        points_coord = make_points_coord(x_vals_device, alpha_value, device, dtype)
        model_eval = eval_parametric_models(module.models, points_coord)
        model_by_alpha[float(alpha_value)] = {key: to_np(value) for key, value in model_eval.items()}

    plot_parametric_family(
        out_dir / "comparison_parametric_transformed.png",
        x_np,
        alpha_values,
        model_by_alpha,
        exact_data,
        value_keys=["F", "B", "H", "W"],
        title="EGB parametric: transformed variables over alpha",
        x_label="x",
        y_label="value"
    )
    r_np = (torch.tan(x_vals) + rh).detach().cpu().numpy().reshape(-1)

    log_r_np = np.log10(r_np)
    
    model_phys_by_alpha = {
        float(alpha_value): physical_from_eval(model_by_alpha[float(alpha_value)], x_np, rh)
        for alpha_value in alpha_values
    }
    exact_phys = physical_from_eval(exact_data, x_np, rh)

    idx_f = int(len(r_np) * 0.8)  
    idx_b = int(len(r_np) * 0.1)  
    idx_h = int(len(r_np) * 0.15) 
    idx_w = int(len(r_np) * 0.6)  

    posiciones_texto_r = {
        "f": (log_r_np[idx_f], exact_phys["f"][idx_f] - 0.2, r"$f(r)$"), 
        "b": (log_r_np[idx_b], exact_phys["b"][idx_b] - 0.2, r"$-b(r)$"),
        "h": (log_r_np[idx_h], exact_phys["h"][idx_h] + 0.1, r"$h(r)/r^2$"),
        "w": (log_r_np[idx_w], exact_phys["w"][idx_w] + 0.1, r"$w(r)$")
    }


    log_r_min = np.log10(args.r_min) if args.r_min > 0 else 0.0
    log_r_max = np.log10(args.r_max) if args.r_max > 0 else 1.3 # 1.3 es aprox log10(20)

    plot_parametric_family(
        out_dir / "comparison_parametric_physical_r.png",
        log_r_np,            
        alpha_values,
        model_phys_by_alpha,
        exact_phys, 
        value_keys=["f", "b", "h", "w"],
        x_label=r"$\log_{10}(r)$",
        y_label=None,
        ref_data=ref_data,  
        text_positions=posiciones_texto_r,
        xlim=(log_r_min, log_r_max),
    )


    print(f"Parametric plots saved in {out_dir}")
    print(f"Parametric plots saved in {out_dir}")


if __name__ == "__main__":
    main()
