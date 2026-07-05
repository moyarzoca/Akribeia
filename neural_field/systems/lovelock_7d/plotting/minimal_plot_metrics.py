#!/usr/bin/env python3
import argparse
import json
from pathlib import Path

# =====================================================================
# Repository root path (dynamically resolved)
# =====================================================================
import sys
# Resolve the repository root dynamically (4 levels up from this script)
# plotting <- Lovelock7D_parametric <- systems <- replication <- difflearning
REPO_ROOT = Path(__file__).resolve().parents[4]

if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import torch
import yaml
from matplotlib.ticker import MaxNLocator, FormatStrFormatter

import utils.builder as builder
import utils.evaluator as evaluator
import utils.grid.distributions as sample
import utils.loader as loader

def parse_args():
    parser = argparse.ArgumentParser(description="Plot training metrics from a Lightning run.")
    parser.add_argument("--version_dir", type=Path, required=True, help="Root to the Lightning version directory (where metrics.csv is located)")
    parser.add_argument("--output", type=Path, default=None, help="Output image path")
    parser.add_argument("--residual_mode", type=str, choices=("abs", "square", "raw"), default="raw")
    return parser.parse_args()

def load_config(config_path: Path) -> dict:
    if not config_path.exists():
        return {}
    text = config_path.read_text(encoding="utf-8")
    return json.loads(text) if config_path.suffix == ".json" else yaml.safe_load(text)

def get_x_axis(df: pd.DataFrame) -> tuple[np.ndarray, str]:
    for col in ["step", "global_step"]:
        if col in df.columns:
            return pd.to_numeric(df[col], errors="coerce").to_numpy(), col
    return np.arange(len(df), dtype=float), "index"

def extract_metric(df: pd.DataFrame, col: str, step_x: np.ndarray):
    if col not in df.columns:
        return np.array([]), np.array([])
    y = pd.to_numeric(df[col], errors="coerce").to_numpy()
    valid = np.isfinite(y)
    return step_x[valid], y[valid]

def process_residuals(version_dir: Path, mode: str):
    """charge the model and evaluate the residuals on a grid of points"""
    
    metrics_path = version_dir / "metrics.csv"
    config_path = version_dir / "config.yaml"
    ckpts = sorted((version_dir / "checkpoints").glob("*.ckpt"))
    
    if not metrics_path.exists() or not ckpts:
        print("[WARN] missing metrics.csv or checkpoints.")
        return None, None, None, None

    ckpt = torch.load(ckpts[-1], map_location="cpu")
    hp = ckpt.get("hyper_parameters", {})
    
    dm_hp = ckpt.get("datamodule_hyper_parameters", {}) 
    
    config = load_config(config_path)
    exp_root_raw = hp.get("experiment_root") or config.get("model", {}).get("experiment_root", REPO_ROOT)
    exp_root = Path(exp_root_raw)

    try:
        space = dm_hp.get("space") or config.get("data", {}).get("space")
        n_points = int(dm_hp.get("N", config.get("data", {}).get("N", 1000)))

        if not space:
            domain_path = dm_hp.get("domain_path") or config.get("data", {}).get("domain_path")
            if domain_path:
                domain_spec = loader.load_spec(exp_root / domain_path)
                space = domain_spec.get("space")
        
        if not space:
            raise ValueError("Cannot infer the domain space from hyperparameters or config.")

        coord_name = next(iter(space))
        dist_type = space[coord_name].get("distribution", {}).get("type", "unknown")
        
        domain_for_grid = {"N": n_points, "space": space}
        points = sample.generate_grid(domain_for_grid, seed=42, device="cpu", dtype=torch.float32)
        x_vals = points[:, 0].numpy().astype(float)
    except Exception as e:
        print(f"[WARN] Cannot infer the domain: {e}")
        return None, None, None, None

    try:
        build_spec_path = hp.get("build_spec_path") or config.get("model", {}).get("build_spec_path")
        build_spec = loader.load_spec(exp_root / build_spec_path)
        models = builder.build_models(build_spec, device="cpu")
        
        for net_name, info in models.items():
            prefix = f"net_modules.{net_name}."
            local_state = {k[len(prefix):]: v for k, v in ckpt["state_dict"].items() if k.startswith(prefix)}
            if local_state:
                info["net"].load_state_dict(local_state, strict=True)
                info["net"].eval()


        runtime_conf = dict(hp.get("conf", config.get("model", {}).get("conf", {})))
        for k, v in ckpt["state_dict"].items():
            if k.startswith("trainable_params."):
                runtime_conf[k.split(".", 1)[1]] = v.detach().cpu()

        eq_path = hp.get("equations_path") or config.get("model", {}).get("equations_path")
        equations = loader.module_from_path(exp_root / eq_path).equations
        
        points_coord = sample.points_to_coord(points, domain_for_grid)
        points_for_eval = sample.coord_to_points(points_coord)
        points_for_eval = points_for_eval.to(device=next(models[list(models.keys())[0]]["net"].parameters()).device,
                                    dtype=next(models[list(models.keys())[0]]["net"].parameters()).dtype)
        models_evaled = evaluator.eval_models(models, points_for_eval)
        
        eq_bundle = equations(models_evaled, points_coord, runtime_conf)
        residuals = eq_bundle.get("equations", [])
        labels = eq_bundle.get("labels", [f"eq_{i}" for i in range(len(residuals))])

    except Exception as e:
        print(f"[WARN] residuals can't be calculated: {e}")
        return x_vals, coord_name, dist_type, None

    lines = []
    for i, res in enumerate(residuals):
        if not isinstance(res, torch.Tensor): continue
        res_np = res.detach().cpu().numpy().astype(float)
        if res_np.ndim == 2: res_np = res_np[:, 0]
        
        if mode == "abs": res_np = np.abs(res_np)
        elif mode == "square": res_np = np.square(res_np)
        
        lines.append((x_vals, res_np, str(labels[i])))

    return x_vals, coord_name, dist_type, lines

def create_plot(df: pd.DataFrame, version_dir: Path, out_path: Path, mode: str):
    step_x, x_name = get_x_axis(df)
    
   
    numeric_cols = [c for c in df.columns if pd.api.types.is_numeric_dtype(df[c]) and c not in {"epoch", "step", "global_step"}]
    loss_cols = [c for c in numeric_cols if "loss" in c.lower()]
    lr_cols = [c for c in numeric_cols if "lr" in c.lower() or "learning_rate" in c.lower()]
    extra_cols = [c for c in numeric_cols if c not in loss_cols and c not in lr_cols][:8]

    dist_x, coord_name, dist_type, residuals = process_residuals(version_dir, mode)

    n_side = max(1, len(extra_cols))
    fig_height = max(8.6, 1.6 * n_side + 5.6)
    fig = plt.figure(figsize=(13.5, fig_height))
    gs = fig.add_gridspec(
        nrows=5,
        ncols=2,
        width_ratios=[3.7, 1.5],
        height_ratios=[4.0, 1.55, 0.4, 1.35, 0.9],  # El 0.4 es una fila "vacía" para dar más espacio
        wspace=0.25, 
        hspace=0.15,  # Espacio general menor entre los subplots 1-2 y 3-4
    )


    ax_loss = fig.add_subplot(gs[0, 0])
    for col in loss_cols:
        x, y = extract_metric(df, col, step_x)
        if len(y) > 0: ax_loss.plot(x, y, lw=1.8, label=col)
    ax_loss.set_ylabel("loss", fontsize=9)
    ax_loss.set_title("Training Metrics", fontsize=10)
    ax_loss.set_yscale("log")
    ax_loss.legend(fontsize=8, loc="best")
    ax_loss.grid(True, alpha=0.3)
    ax_loss.tick_params(axis="both", labelsize=8)

    ax_lr = fig.add_subplot(gs[1, 0], sharex=ax_loss)  
    for col in lr_cols:
        x, y = extract_metric(df, col, step_x)
        if len(y) > 0: ax_lr.plot(x, y, lw=1.4, label=col)
    ax_lr.set_ylabel("learning rate", fontsize=9)
    if len(lr_cols) > 0: 
        ax_lr.set_yscale("log")
        ax_lr.legend(fontsize=8, loc="best")
    ax_lr.grid(True, alpha=0.3)
    ax_lr.tick_params(axis="both", labelsize=8)
    ax_lr.set_xlabel("Steps", fontsize=9)


    ax_res = fig.add_subplot(gs[3, 0])
    if residuals:
        for ex, ey, label in residuals:
            ax_res.plot(ex, ey, "--", lw=1.1, alpha=0.9, label=label)
        if mode == "square": ax_res.axhline(0, color="gray", lw=0.9, alpha=0.5)
        ax_res.legend(fontsize=8, loc="best")
    else:
        ax_res.text(0.03, 0.5, "No equation residuals", transform=ax_res.transAxes, va="center", fontsize=9)
    res_label = {"abs": "|residual|", "square": "residual^2", "raw": "residual"}.get(mode, "residual")
    ax_res.set_ylabel(res_label, fontsize=9)
    ax_res.grid(True, alpha=0.3)
    ax_res.tick_params(axis="both", labelsize=8)


    ax_dist = fig.add_subplot(gs[4, 0])
    if dist_x is not None:
        ax_dist.plot(dist_x, np.zeros_like(dist_x), "|", ms=12, alpha=0.035, color="royalblue", mew=0.9)
        ax_dist.set_yticks([])
        #ax_dist.set_title(f"Point sampling: {dist_type} (N={len(dist_x)})", fontsize=6, pad=8)
    else:
        ax_dist.text(0.03, 0.5, "No point distribution data", transform=ax_dist.transAxes, va="center", fontsize=9)
    ax_dist.set_xlabel(f"{coord_name} grid ({dist_type})" or f"x grid ({dist_type})", fontsize=9)
    ax_dist.set_ylabel(f"Points", fontsize=9)
    ax_dist.grid(True, alpha=0.2, axis="x")
    ax_dist.tick_params(axis="both", labelsize=8)

    side_gs = gs[:, 1].subgridspec(n_side, 1, hspace=0.35)
    for i, col in enumerate(extra_cols):
        ax = fig.add_subplot(side_gs[i, 0])
        x, y = extract_metric(df, col, step_x)
        if len(y) > 0:
            ax.plot(x, y, lw=1.4)

            if np.all(y > 0) and (np.max(y) / (np.min(y) + 1e-9) > 100):
                ax.set_yscale("log")
            else:

                ax.yaxis.set_major_locator(MaxNLocator(nbins=4)) 
                ax.yaxis.set_major_formatter(FormatStrFormatter('%.3g')) 
                
        ax.set_ylabel(col, fontsize=9)
        ax.grid(True, alpha=0.3)
        ax.tick_params(axis="both", labelsize=8)
        if i == len(extra_cols) - 1: 
            ax.set_xlabel(x_name , fontsize=9)


    plt.setp(ax_loss.get_xticklabels(), visible=False)
    plt.setp(ax_res.get_xticklabels(), visible=False) # Eliminado para conservar los valores en el eje x

    import warnings
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", UserWarning)
        
    out_path.parent.mkdir(parents=True, exist_ok=True)
    fig.savefig(out_path, dpi=200, bbox_inches="tight")
    plt.close(fig)

def main():
    args = parse_args()
    metrics_path = args.version_dir / "metrics.csv"
    if not metrics_path.exists():
        raise FileNotFoundError(f"Cannot find metrics.csv en {args.version_dir}")

    df = pd.read_csv(metrics_path)
    out_path = args.output or (args.version_dir / "metrics.png")
    
    create_plot(df, args.version_dir, out_path, args.residual_mode)
    print(f"Plot saved in: {out_path}")

if __name__ == "__main__":
    main()