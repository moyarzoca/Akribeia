#!/usr/bin/env bash
set -e

# Seed paths, output paths, stages, and refinement parameters are hardcoded.
# Update them to match the runs you want to refine.

GAUSSNEWTON="../gauss-newton-refiner"
DIFFLEARNING="../difflearning"
PROBLEM="refinement/5D_FBHWC0"
LOV_SYSTEM="systems/lovelock_5d"

echo "---------------------- stage 2 5D"

wolframscript -script "$GAUSSNEWTON/gauss-newton.wl" \
	--seed "neural_field/$LOV_SYSTEM/pre-trained/stage2/logs/version_0/checkpoints/best.json" \
	--output "neural_field/$LOV_SYSTEM/pre-trained/stage2/logs/version_0/pseudo-spectral" \
	--problem "$PROBLEM" \
	--config.alpha 1 \
	--config.Oh 33/100 \
	--pre 310


PROBLEM="refinement/7D_FBHWC0"
LOV_SYSTEM="systems/lovelock_7d"

echo "---------------------- stage 1 7D"

wolframscript -script "$GAUSSNEWTON/gauss-newton.wl" \
	--seed "neural_field/$LOV_SYSTEM/pre-trained/stage1/logs/version_0/checkpoints/best.json" \
	--output "neural_field/$LOV_SYSTEM/pre-trained/stage1/logs/version_0/pseudo-spectral" \
	--problem "$PROBLEM" \
	--config.alpha 0.5 \
	--config.beta 0.4 \
	--config.Oh 33/100 \
	--pre 310

echo "---------------------- stage 2 7D"

wolframscript -script "$GAUSSNEWTON/gauss-newton.wl" \
	--seed "neural_field/$LOV_SYSTEM/pre-trained/stage2/logs/version_0/checkpoints/best.json" \
	--output "neural_field/$LOV_SYSTEM/pre-trained/stage2/logs/version_0/pseudo-spectral" \
	--problem "$PROBLEM" \
	--config.alpha 0.5 \
	--config.beta 0.4 \
	--config.Oh 33/100 \
	--pre 310


