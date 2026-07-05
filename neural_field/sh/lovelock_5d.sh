#!/usr/bin/env bash
set -e

# Editable roots (change these on a new machine)
# These paths assume you are running the script from the 'replication/sh' directory.
PY_ROOT="../../../difflearning"
REPLICATION_ROOT="../"
SYSTEM_ROOT="../systems/lovelock_5d"
OUTPUT_ROOT="$SYSTEM_ROOT/out/run_results"

run_python() {
  uv run --project "$PY_ROOT" python "$@"
}

BOUNDARY_PY="boundary.py"
EQUATIONS_PY="equations.py"

TRAIN_PY="$PY_ROOT/train.py"

# =====================================================================
# Roots for plotting and exporting (change if you have different scripts or want to skip some)
# =====================================================================
PLOT_METRICS_PY="$SYSTEM_ROOT/plotting/minimal_plot_metrics.py"
PLOT_FUNCS_PY="$SYSTEM_ROOT/plotting/minimal_plot_parametric.py" 
# =====================================================================

# Stage 1 config
CONFIG="$REPLICATION_ROOT/config/egb_stage1_parametric.yaml"
WARMUP_STEPS=2000
STABLE_STEPS=30000
COSINE_STEPS=3000
MAX_STEPS_STAGE1=60000
N1=6000

# Stage 2 config
CONFIG2="$REPLICATION_ROOT/config/egb_stage2_parametric.yaml"
STEPS_PHASE2=5000
N2=16000

OPT_LR=1.0
OPT_MAX_ITER=10
OPT_HISTORY_SIZE=50
OPT_LINE_SEARCH_FN=strong_wolfe
OPT_TOLERANCE_GRAD=1.0e-8
OPT_TOLERANCE_CHANGE=1.0e-10

parameter2=rh
VAL2=1.0

START_ID=1
RUNID=$START_ID

EXPROOT="$SYSTEM_ROOT"
RUN_ROOT=""

while true; do
  RUN_ROOT="$OUTPUT_ROOT/run_${RUNID}"
  if [ ! -d "$RUN_ROOT" ]; then
    break
  fi
  RUNID=$((RUNID + 1))
done

mkdir -p "$EXPROOT"
mkdir -p "$OUTPUT_ROOT"

echo "========================================="
echo "Running...."
echo "========================================="

OUTDIR="$RUN_ROOT"
mkdir -p "$OUTDIR"

RUN_JSON="networks/hard_net.json"

CONF_JSON=$(printf '{"%s": %s}' "$parameter2" "$VAL2")

REL_ROOT="${OUTDIR#"$SYSTEM_ROOT"}"
REL_ROOT="${REL_ROOT#/}"
echo "Relative root: $REL_ROOT"
DATA='{"x": {"interval": [0.0, 1.570708], "distribution": {"type": "chebyshev"}}, "alph": {"interval": [0.0, 3.0], "distribution": {"type": "uniform"}}}'


# ================= STAGE 1 =================

STAGE1_DIR="$OUTDIR/stage1"

run_python "$TRAIN_PY" fit \
  --config "$CONFIG" \
  --model.experiment_root "$EXPROOT" \
  --model.boundary_path boundary.py \
  --model.build_spec_path "$RUN_JSON" \
  --model.optimizer.init_args.lr 0.001 \
  --model.lr_scheduler.class_path utils.schedulers.WarmupStablePlateauCosineLR \
  --model.lr_scheduler.init_args.warmup_steps "$WARMUP_STEPS" \
  --model.lr_scheduler.init_args.stable_steps "$STABLE_STEPS" \
  --model.lr_scheduler.init_args.cosine_steps "$COSINE_STEPS" \
  --model.lr_scheduler.init_args.plateau_reductions_before_cosine 3 \
  --model.lr_scheduler.init_args.patience 1000 \
  --model.lr_scheduler.init_args.factor 0.5 \
  --model.lr_scheduler.init_args.threshold_mode rel \
  --model.lr_scheduler.init_args.threshold 1.0e-3 \
  --model.lr_scheduler.init_args.cooldown 250 \
  --model.lr_scheduler.init_args.min_lr 1e-7 \
  --model.lr_scheduler_config '{"monitor": "train_loss", "interval": "step", "frequency": 1}' \
  --trainer.max_steps "$MAX_STEPS_STAGE1" \
  --data.experiment_root "$EXPROOT" \
  --model.conf "$CONF_JSON" \
  --data.space "$DATA" \
  --trainer.max_epochs -1 \
  --trainer.log_every_n_steps 50 \
  --trainer.val_check_interval 50 \
  --trainer.default_root_dir "$STAGE1_DIR" \
  --trainer.logger.init_args.save_dir "$STAGE1_DIR" \
  --trainer.logger.init_args.version 0 \
  --trainer.logger.init_args.name logs \
  --trainer.callbacks='[
   {"class_path": "utils.callbacks.SaveInitialCheckpoint",
   "init_args": {"filename": "seed.ckpt"}},
   {"class_path": "lightning.pytorch.callbacks.ModelCheckpoint", "init_args": {"dirpath": "'"$STAGE1_DIR/logs/version_0/checkpoints"'", "monitor": "train_loss", "mode": "min", "save_top_k": 1, "filename": "best"}}]' \
  --data.N "$N1"

sleep 3

# If the seed is saved through the callback, this line exports it to json
run_python "$PY_ROOT/export_checkpoint.py" \
  --input "$STAGE1_DIR/seed/seed.ckpt" \
  --output "$STAGE1_DIR/seed/seed.json"

run_python "$PY_ROOT/export_checkpoint.py" \
  --input "$STAGE1_DIR/logs/version_0/checkpoints/best.ckpt" \
  --output "$STAGE1_DIR/logs/version_0/checkpoints/best.json"

# Plotting Stage 1
mkdir -p "$OUTDIR/stage1/plots"
if ! run_python "$PLOT_METRICS_PY" \
  --version_dir "$OUTDIR/stage1/logs/version_0" \
  --residual_mode raw \
  --output "$OUTDIR/stage1/plots/metrics.png"; then
  echo "[WARN] The metrics plot script failed."
fi

# ================= STAGE 2 =================

STAGE2_DIR="$OUTDIR/stage2"

run_python "$TRAIN_PY" fit \
  --config "$CONFIG2" \
  --model.experiment_root "$EXPROOT" \
  --model.boundary_path boundary.py \
  --model.build_spec_path "$RUN_JSON" \
  --model.from_checkpoint "$REL_ROOT/stage1/logs/version_0/checkpoints/best.ckpt" \
  --data.experiment_root "$EXPROOT" \
  --model.conf "$CONF_JSON" \
  --model.optimizer.init_args.lr "$OPT_LR" \
  --model.optimizer.init_args.max_iter "$OPT_MAX_ITER" \
  --model.optimizer.init_args.history_size "$OPT_HISTORY_SIZE" \
  --model.optimizer.init_args.line_search_fn "$OPT_LINE_SEARCH_FN" \
  --model.optimizer.init_args.tolerance_grad "$OPT_TOLERANCE_GRAD" \
  --model.optimizer.init_args.tolerance_change "$OPT_TOLERANCE_CHANGE" \
  --data.space "$DATA" \
  --trainer.max_steps "$STEPS_PHASE2" \
  --trainer.max_epochs -1 \
  --trainer.log_every_n_steps 50 \
  --trainer.val_check_interval 50 \
  --trainer.default_root_dir "$STAGE2_DIR" \
  --trainer.logger.init_args.save_dir "$STAGE2_DIR" \
  --trainer.logger.init_args.version 0 \
  --trainer.logger.init_args.name logs \
  --trainer.callbacks='[{"class_path": "lightning.pytorch.callbacks.ModelCheckpoint", "init_args": {"dirpath": "'"$STAGE2_DIR/logs/version_0/checkpoints"'", "monitor": "train_loss", "mode": "min", "save_top_k": 1, "filename": "best"}}]' \
  --data.N "$N2"

sleep 3

run_python "$PY_ROOT/export_checkpoint.py" \
  --input "$STAGE2_DIR/logs/version_0/checkpoints/best.ckpt" \
  --output "$STAGE2_DIR/logs/version_0/checkpoints/best.json"

# ================= EXPORT STAGE 2 =================
mkdir -p "$OUTDIR/stage2/plots"

# 1. Plot Metrics
if ! run_python "$PLOT_METRICS_PY" \
  --version_dir "$OUTDIR/stage2/logs/version_0" \
  --residual_mode raw \
  --output "$OUTDIR/stage2/plots/metrics.png"; then
  echo "[WARN] The metrics plot script failed."
fi

# 2. Plot Funciones (F, B, W, H)
if ! run_python "$PLOT_FUNCS_PY" \
  --version_dir "$OUTDIR/stage2/logs/version_0" \
  --output_dir "$OUTDIR/stage2/plots" \
  --r_min 0.0 \
  --r_max 10.0\
  --alph_min 0.0 --alph_max 3.0 --alph_step 0.3; then
  echo "[WARN] The plot functions script failed."
fi


echo "========================================================="
echo "All stages completed ..."
echo "========================================================="


echo "Done. Check the folder $RUN_ROOT"
