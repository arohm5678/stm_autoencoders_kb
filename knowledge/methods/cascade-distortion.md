---
type: method
title: "Cascade Distortion"
aliases:
  - "CD Loss"
category: neural
introduced_in: "[Clemot et al. (2025)](../papers/clemot-2025-topological.md)"
parent_methods: []
child_methods: []
related_methods:
  - "topoae-plus-plus"
key_papers:
  - "[Clemot et al. (2025)](../papers/clemot-2025-topological.md)"
complexity: "Linear to tracking complexity of boundary reduction"
convergence_rate: ""
tags:
  - method
---

## Overview

**Cascade Distortion** is a topological loss regularization term designed to constrain the metric shapes of cycles in dimensionality reduction. Instead of penalizing only the birth and death edges (which represents the bare minimum to maintain persistent homology but can lead to self-intersecting or mangled cycle visualizations), Cascade Distortion penalizes the distortion of all edges within the global cascade skeleton—namely, the simplicial chains that fill the persistent homology cycles.

## Algorithm

Given a point cloud $X$ and its latent coordinates $Z$:
1.  **Global Cascade Skeleton** $\operatorname{GCS}^d(X)$ is computed as the union of edges in the boundary cascades for all positive persistence pairs $(\tau, \sigma)$ in dimensions $k \le d$:
    $$\operatorname{GCS}^d(X) = \bigcup_{k=0}^d \bigcup_{(\tau,\sigma) \in \mathcal{P}^k} \operatorname{cascade}[\sigma]^{(1)}$$
2.  **Loss Evaluation**:
    $$\mathcal{L}_{\text{CD}}^d(X, Z) = \|A^X[\operatorname{GCS}^d(X)] - A^Z[\operatorname{GCS}^d(X)]\|_2^2 + \|A^Z[\pi^d(Z)] - A^X[\pi^d(Z)]\|_2^2$$
    where the first term ensures isometric embedding of the cycle filling chains, and the second term prevents the birth of spurious cycles in $Z$.
