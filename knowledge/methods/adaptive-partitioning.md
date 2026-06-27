---
type: method
title: "Adaptive Partitioning"
aliases:
  - "Tree-Structured Partitioning"
  - "Adaptive Splitting"
category: classical
introduced_in: "[Binev (2005)](../papers/binev-2005-universal.md)"
parent_methods: []
child_methods: []
related_methods:
  - "least-squares-fitting"
key_papers:
  - "[Binev (2005)](../papers/binev-2005-universal.md)"
complexity: "O(m log m)"
convergence_rate: "O((\\frac{\\log m}{m})^{\\frac{2s}{2s+1}})"
tags:
  - method
---

## Overview

Adaptive partitioning refers to algorithms that divide a domain $X$ into subsets (typically hypercubes or tree-structured subdivisions) dynamically, depending on the spatial distribution of the data or features of a target function $f$. In nonparametric regression, adaptive partitioning helps localise features, focusing computational power and representation capacity in regions with higher variation or complexity.

## Algorithm

The adaptive partitioning algorithm proposed in [Binev (2005)](../papers/binev-2005-universal.md) is structured as follows:

1.  **Define maximum depth** $j_0$ based on sample size $m$:
    $$a^{j_0} \le \tau_m^{-1/\gamma}, \quad \text{where } \tau_m = \kappa \sqrt{\frac{\log m}{m}}$$
2.  **Compute refinement energy** $\varepsilon_I(\mathbf{z})^2$ for each node $I$ in a master tree of partitions up to depth $j_0$:
    $$\varepsilon_I(\mathbf{z})^2 := \sum_{J \in C(I)} \frac{\alpha_J(\mathbf{z})^2}{\rho_J(\mathbf{z})} - \frac{\alpha_I(\mathbf{z})^2}{\rho_I(\mathbf{z})}$$
    where $\alpha_J(\mathbf{z})$ and $\rho_J(\mathbf{z})$ are empirical estimates of projection coefficients.
3.  **Thresholding**: Filter nodes where $\varepsilon_I(\mathbf{z}) \ge \tau_m$.
4.  **Tree Completion**: Generate the smallest proper tree $\mathcal{T}(\mathbf{z}, m)$ containing the filtered nodes.
5.  **Output**: Construct a partition $\Lambda$ from the outer leaves of $\mathcal{T}(\mathbf{z}, m)$ and run a least-squares projection on this partition.

## Convergence Properties

Under this adaptive partitioning algorithm, the estimator $f_{\mathbf{z}}$ achieves minimax optimal convergence rates without prior knowledge of the target function's smoothness parameter $s$:
$$\mathbb{E}(\|f_\rho - f_{\mathbf{z}}\|^2) \le C \left( \frac{\log m}{m} \right)^{\frac{2s}{2s+1}}$$
where $f_\rho \in \mathcal{A}^{\gamma} \cap \mathcal{B}^s$.

## Advantages / Limitations

### Advantages
- **Universal**: Adapts dynamically to unknown smoothness $s$ without needing it as an input parameter.
- **Fast and On-line Updateable**: Refinements are updated locally on new sample arrival, bypassing the need to solve global Optimization.

### Limitations
- **Piecewise Constants Only**: Limiting approximation spaces to order $s \le 1$.
- **Hyperparameter $\gamma$**: Requires selecting a search threshold regulator $\gamma > 0$ to limit maximum tree depth.
