# Replication

This folder contains the replication experiments for the parametric PINN workflows used in this repository.

The replication folder covers the following two systems:

- `EGB_parametric`: 5D rotating equal-angular-momentum in Einstein-Gauss-Bonnet
- `Lovelock7D_parametric`: 7D rotating equal-angular-momentum quadratic and cubic Lovelock

The general idea of both systems is to train a PINN on a transformed radial coordinate `x` and a parametric variable, then refine the solution (using LBFGS) from a checkpoint and generate diagnostic plots.

## Repository Layout

- `replication/sh/`: shell drivers that launch the full pipeline
- `replication/systems/<system>/equations.py`: ODE residuals for the system
- `replication/systems/<system>/boundary.py`: boundary conditions
- `replication/systems/<system>/exact_solutions.py`: analytic reference solution
- `replication/systems/<system>/networks/`: JSON network specifications
- `replication/systems/<system>/plotting/`: metrics and solution plotting scripts
- `replication/systems/<system>/numerical-data/`: optional reference CSV data for plots from Kunz-Radu et al.
- `replication/systems/<system>/out/`: generated run outputs

## Shared Pipeline

The workflow is organized into two training stages plus post-processing:

1. Stage 1
   - Coarse training / initialization stage
   - Uses Adam with a warmup, stable, plateau, and cosine learning-rate schedule
   - Samples collocation points on the problem domain
   - Produces the first checkpoint and metrics logs

2. Stage 2
   - Refinement stage started from the Stage 1 checkpoint
   - Uses LBFGS for a more accurate solve
   - (Usually) increases the number of collocation points and/or training steps
   - Produces the final checkpoint and metrics logs

3. Post-processing
   - Plot training metrics
   - Plot the learned functions vs. the exact/reference solution

## Entry Points

Run the shell scripts from `replication/sh/`.

If you install the difflearning repo using uv, run the shell scripts as follows:

```bash
uv run bash EGB_parametric_solve.sh
uv run bash Lovelock7D_parametric_solve.sh
```

The scripts assume relative paths from `replication/sh/`, so moving them to another location usually requires adjusting the path variables at the top of each script.

## System Details

### `EGB_parametric`

- Physical problem: 5D equal-angular-momentum rotating configuration
- Parametric variable: `alph`
- Fixed configuration parameter: `rh = 1.0`
- Domain:
  - `x in [0, 1.570708]` with Chebyshev sampling
  - `alph in [0.0, 3.0]` with uniform sampling
- Field variables in the system definition: `F`, `B`, `H`, `W`
- Trainable parameter: `C0`
- Exact solution file: `replication/systems/EGB_parametric/exact_solutions.py`
- ODEs and boundary definitions: `equations.py`, `boundary.py`
- Network spec: `networks/build_spec.json` and runtime spec `networks/hard_net.json`

Stage 1 parameters in `replication/sh/EGB_parametric_solve.sh`:

- config: `replication/config/egb_stage1_parametric.yaml`
- optimizer: Adam, `lr = 1e-3`
- scheduler: `WarmupStablePlateauCosineLR`
- `warmup_steps = 2000`
- `stable_steps = 30000`
- `cosine_steps = 3000`
- `max_steps = 60000`
- collocation points: `N = 6000`

Stage 2 parameters:

- config: `replication/config/egb_stage2_parametric.yaml`
- optimizer: LBFGS, `lr = 1.0`
- `max_iter = 10`
- `history_size = 50`
- `line_search_fn = strong_wolfe`
- `tolerance_grad = 1e-8`
- `tolerance_change = 1e-10`
- `max_steps = 5000`
- collocation points: `N = 16000`

Outputs are written under:

- `replication/systems/EGB_parametric/out/run_results/Run_*_MP/`

### `Lovelock7D_parametric`

- Physical problem: 7D quadratic and cubic Lovelock with a rotating equal-angular-momentum ansatz
- Parametric variable used in the driver: `bet` (coupling of the cubic term)
- Additional fixed/configuration parameters: `rh`, `alph`
- Domain:
  - `x in [0, 1.570708]` with Chebyshev sampling
  - `bet in [0.0, 0.5]` with uniform sampling in the current driver
- Field variables in the system definition: `F`, `B`, `H`, `W`
- Trainable parameter: `C0`
- Exact solution file: `replication/systems/Lovelock7D_parametric/exact_solutions.py`
- ODEs and boundary definitions: `equations.py`, `boundary.py`
- Plotting scripts: `plotting/minimal_plot_metrics.py`, `plotting/minimal_plot_tilde_parametric.py`

The Lovelock driver follows the same two-stage pattern as the EGB script, but it is adapted to the 7D system and uses its own output naming and plotting conventions.

## System Files

Each system folder provides the problem-specific pieces that the generic training code consumes:

- `equations.py` defines the residuals used by the solver loss
- `boundary.py` defines the horizon and asymptotic boundary conditions
- `exact_solutions.py` provides the analytic reference used in validation and plotting
- `networks/hard_net.json` is the runtime network specification used by the replication scripts. It imposes the boundary condition `W(rH) = Oh` in a hard way.

## Outputs

Each run produces Lightning logs, checkpoints, metrics plots, and parameter-sweep figures inside the corresponding `out/` tree. The most important files are:

- `stage1/logs/version_0/checkpoints/*.ckpt`
- `stage2/logs/version_0/checkpoints/*.ckpt`
- `stage1/plots/metrics.png`
- `stage2/plots/metrics.png`
- parametric comparison plots in the stage 2 plot directory

## Notes

- The root-level `export_checkpoint.py` script can be used to export a trained `.ckpt` checkpoint to a JSON file, in a format that can be consumed by the Gauss-Newton solver for further refinement.
- The exact hyperparameter values are encoded in the shell scripts and YAML configs listed above.
- The `replication/systems/<system>/out/` directories are generated artifacts and can be regenerated by rerunning the corresponding shell script.
