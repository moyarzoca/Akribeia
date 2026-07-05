<pre>
 █████  ██   ██ ██████  ██ ██████  ███████ ██  █████
██   ██ ██  ██  ██   ██ ██ ██   ██ ██      ██ ██   ██
███████ █████   ██████  ██ ██████  █████   ██ ███████
██   ██ ██  ██  ██   ██ ██ ██   ██ ██      ██ ██   ██
██   ██ ██   ██ ██   ██ ██ ██████  ███████ ██ ██   ██
</pre>

# Akribeia

Akribeia is an algorithm that allows combining machine learning methods with a deterministic Gauss-Newton integration method. In this repository, it is applied to construct rotating solutions in 5D and 7D Lovelock theories.

It combines two complementary components:

- `difflearning`: neural-network based approximation of the solution space
- `gauss-newton-refiner`: deterministic pseudo spectral refinement from neural seeds

This repository contains the problem-specific physics content:
- the 5D and 7D equations
- boundary conditions and reconstruction logic
- training and refinement drivers
- experiment configuration and outputs

The external repositories provide the reusable method implementations.  
Akribeia provides the paper-specific orchestration and reproducibility layer.

## Installation

Akribeia assumes the following sibling-directory layout:

```text
akribeia-workspace/
  difflearning/
  gauss-newton-refiner/
  akribeia/
```

First install uv, which is used to create and synchronize the Python environment for difflearning:

```
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Then clone the repositories:

```
mkdir akribeia-workspace
cd akribeia-workspace

git clone --branch v2.1.0 https://github.com/moyarzoca/difflearning.git difflearning
git clone --branch v1.0.0 https://github.com/moyarzoca/deterministic-gauss-newton-wl.git gauss-newton-refiner
git clone https://github.com/moyarzoca/Akribeia.git akribeia
```

Set up the Python environment for difflearning:

```
cd difflearning
uv sync --locked
```

## Requirements

- Python 3.12 or newer
- uv
- Wolfram Engine / Mathematica 14.3 or newer

## Instructions

### Neural field solution

To construct the neural network models:

```bash
cd neural_field/sh/
```
To construct the 5D neural-field rotating black-hole solution, run:

```bash
./lovelock_5d.sh
```

For the 7D neural-field rotating black-hole solution, run:

```bash
./lovelock_7d.sh
```
These algorithms will generate output directories under

```
neural_field/systems/lovelock_*d/out/
```
which contain the trained models with their respective weight `.json` files that will be consumed by `gauss-newton-refiner`.

### Pseudo-spectral refinement

The models constructed in the previous phase are functions of $(x, \alpha)$, where $\alpha$ stands for the appropriate coupling constant of the theory.

The pseudo-spectral method implemented in `gauss-newton-refiner` is one-dimensional, so the coupling constant must be fixed before refining a solution.

This workflow is implemented in `akribeia.sh`, which currently launches two refinement jobs:

- a 5D refinement using the seed from `run_1/stage2`
- a 7D refinement using the seed from `run_4/stage1`

The script returns the Chebyshev coefficients and the function values on the Chebyshev grid for the last stage. The input seed paths, output paths, and refinement parameters are hardcoded, so they should be updated if your run numbers or stages differ.
