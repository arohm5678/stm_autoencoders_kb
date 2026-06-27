---
type: concept
title: "Topological Autoencoders"
aliases:
  - "TopoAE"
category: ml-method
first_appearance: "2020 (Moor et al.)"
key_equation: "\\mathcal{L}_{\\text{TAE}}^0 = \\|A^X[\\operatorname{MST}(X)] - A^Z[\\operatorname{MST}(X)]\\|_2^2 + \\|A^Z[\\operatorname{MST}(Z)] - A^X[\\operatorname{MST}(Z)]\\|_2^2"
parent_concepts: []
child_concepts:
  - "[TopoAE++](../methods/topoae-plus-plus.md)"
related_concepts:
  - "[Persistent Homology](persistent-homology.md)"
key_papers:
  - "[Moor et al. (2020)](../papers/moor-2020-topological.md)"
  - "[Clemot et al. (2025)](../papers/clemot-2025-topological.md)"
tags:
  - concept
---

## Definition

Topological Autoencoders (TopoAE) are neural network models designed for dimensionality reduction that preserve the topological structure (specifically persistent homology) of high-dimensional input spaces in low-dimensional visual layouts. By adding a topological regularization term $\mathcal{L}_t$ to the reconstruction loss, they enforce that coordinates close to topological features (like clusters or cycles) in high dimensions maintain their structural configurations in the latent projection.

## Mathematical Formulation

For an input dataset $X$ and its latent representation $Z$, the classic 0-dimensional topological regularization matches the edge lengths of the Minimum Spanning Trees (MST):
$$\mathcal{L}_{\text{TAE}}^0 = \|A^X[\operatorname{MST}(X)] - A^Z[\operatorname{MST}(X)]\|_2^2 + \|A^Z[\operatorname{MST}(Z)] - A^X[\operatorname{MST}(Z)]\|_2^2$$
where $A^X$ and $A^Z$ denote the distance matrices evaluated over $X$ and $Z$ respectively.

## Key Properties

- **Wasserstein Bounded**: Moor et al. and [Clemot et al. (2025)](../papers/clemot-2025-topological.md) showed that the loss upper bounds the $L_2$-Wasserstein distance between the 0-dimensional persistence diagrams of the input and projection:
  $$\mathcal{W}_2(\mathcal{D}^0_{\text{Rips}}(X), \mathcal{D}^0_{\text{Rips}}(Z))^2 \le \mathcal{L}^0_{\text{TAE}}(X, Z)$$
- **Preserves Cluster Structures**: By matching MST edges, TopoAE preserves the multi-scale cluster hierarchies ($\mathrm{PH}^0$) during dimension reduction.
