---
type: method
title: "TopoAE++"
aliases:
  - "Topological Autoencoders++"
category: neural
introduced_in: "[Clemot et al. (2025)](../papers/clemot-2025-topological.md)"
parent_methods:
  - "least-squares-fitting"
child_methods: []
related_methods:
  - "cascade-distortion"
key_papers:
  - "[Clemot et al. (2025)](../papers/clemot-2025-topological.md)"
complexity: "Near-linear time for 2D representation"
convergence_rate: ""
tags:
  - method
---

## Overview

**TopoAE++** is a topology-aware dimensionality reduction method designed to preserve 1-dimensional persistent homology ($\mathrm{PH}^1$) when projecting high-dimensional data into visual layouts (usually $\mathbb{R}^2$). It solves the failure cases of naive critical-edge topological autoencoders by regularising the projection with a **cascade distortion** penalty that targets the entire cycle fill chains (cascades) rather than just the birth/death edges.

## Algorithm

The TopoAE++ framework operates as follows:
1.  **Encoder-Decoder Network**: Encodes input $X \subset \mathbb{R}^h$ into $Z \subset \mathbb{R}^2$ and decodes it back to $\tilde{X}$.
2.  **Topological Regularisation**: Adds the Cascade Distortion loss $\mathcal{L}_{\text{CD}}^1(X, Z)$ to the MSE reconstruction loss.
3.  **Fast 2D PH Solver**: At each optimization step, computes the persistence diagram $\mathcal{D}^1_{\text{Rips}}(Z)$ using a specialized geometric algorithm:
    - Compute Delaunay triangulation and Urquhart graph.
    - Extract Relative Neighborhood Graph (RNG).
    - Find minmax length (MML) triangulation longest edges on each RNG-polygon to identify cycle-killing edges.
    - Build dual graph and resolve pairing via Kruskal's algorithm.

## Convergence Properties

Maintains competitive reconstruction error while improving topological similarity metrics (Wasserstein distance of $\mathrm{PH}^1$ persistence diagrams) by up to 48% on cyclic datasets compared to original TopoAE.
