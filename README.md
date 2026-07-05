<pre>
 █████  ██   ██ ██████  ██ ██████  ███████ ██  █████
██   ██ ██  ██  ██   ██ ██ ██   ██ ██      ██ ██   ██
███████ █████   ██████  ██ ██████  █████   ██ ███████
██   ██ ██  ██  ██   ██ ██ ██   ██ ██      ██ ██   ██
██   ██ ██   ██ ██   ██ ██ ██████  ███████ ██ ██   ██
</pre>

# Akribeia

Akribeia is the main research repository for the paper on 5D and 7D rotating black-hole solutions.

It combines two complementary components:

- `difflearning`: neural-network based approximation of the solution space
- `gauss-newton-refiner`: deterministic Gauss-Newton refinement from neural seeds

This repository contains the problem-specific physics content of the paper:
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

git clone --branch v2.0.0 https://github.com/moyarzoca/difflearning.git difflearning
git clone --branch v1.0.0 https://github.com/moyarzoca/deterministic-gauss-newton-wl.git gauss-newton-refiner
git clone https://github.com/moyarzoca/Akribeia.git Akribeia
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
