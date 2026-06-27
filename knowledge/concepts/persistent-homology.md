---
type: concept
title: "Persistent Homology"
aliases:
  - "PH"
category: topology
first_appearance: "2002 (Edelsbrunner et al.)"
key_equation: "\\operatorname{Rips}_r(X) = \\{\\sigma \\subset X \\mid \\max_{x,y \\in \\sigma} \\|x - y\\|_2 \\le r\\}"
parent_concepts: []
child_concepts: []
related_concepts:
  - "[Topological Autoencoders](topological-autoencoders.md)"
key_papers:
  - "[Clemot et al. (2025)](../papers/clemot-2025-topological.md)"
tags:
  - concept
---

## Definition

Persistent Homology is a method in topological data analysis (TDA) that measures topological features of space (such as connected components, cycles, and cavities) at different spatial scales. It tracks these features across a nested sequence of simplicial complexes (called a *filtration*), recording the scale (time) at which each feature is born and dies.

## Mathematical Formulation

For a point cloud $X$, the Rips filtration is constructed by growing balls of radius $r/2$ around each point, forming a sequence of Rips complexes:
$$\operatorname{Rips}_r(X) = \{\sigma \subset X \mid \delta(\sigma) \le r\}$$
where $\delta(\sigma)$ is the diameter of the simplex $\sigma$.
Topological features correspond to homology groups $H_k(\operatorname{Rips}_r(X))$:
- $\mathrm{PH}^0$: Connected components / clusters.
- $\mathrm{PH}^1$: Topological loops / cycles.
- $\mathrm{PH}^2$: Void spaces / cavities.

Persistence diagrams represent each topological feature as a coordinate pair $(b_i, d_i)$ in $\mathbb{R}^2$ representing its birth and death thresholds.
