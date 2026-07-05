#!/usr/bin/env bash
set -e

GAUSSNEWTON="../gauss-newton-refiner"
PROBLEM=problems/5D_FBHWC0

wolframscript -script $GAUSSNEWTON/gauss-newton.wl \
	--seed difflearning/replication/systems/EGB_parametric/out/run_results/Run_3_MP/stage1/logs/version_0/checkpoints/epoch=0-step=25250.json \
	--output difflearning/replication/systems/EGB_parametric/out/run_results/Run_3_MP/stage1/logs/version_0/gauss-newton \
	--problem $PROBLEM \
	--config.alpha 1 \
	--config.Oh 33/100 \
	--pre 310

