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
you need to clone difflearning, gauss-newton-refiner and Akribia following the next directory structure 
```bash
mkdir akribeia-workspace
cd akribeia-workspace

git clone --branch v2.0.0 https://github.com/moyarzoca/difflearning.git difflearning
git clone --branch v1.0.0 https://github.com/moyarzoca/deterministic-gauss-newton-wl.git gauss-newton-refiner
git clone https://github.com/moyaroca/akribeia.git
```
