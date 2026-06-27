---
type: paper
title: "Topological Autoencoders++: Fast and Accurate Cycle-Aware Dimensionality Reduction"
authors:
  - "Matteo Clemot"
  - "Julie Digne"
  - "Julien Tierny"
year: 2025
venue: "arXiv preprint"
venue_type: preprint
doi: "10.48550/arXiv.2502.20215"
arxiv: "2502.20215"
pdf: "raw/pdfs/topological-autoencoders/clemot-2025-topological.pdf"
bibtex_key: clemot2025topological
status: ingested
date_ingested: 2026-06-26
source_trace:
  pages_read: "1-21"
  transcription_method: "read-tool"
  date_read: 2026-06-26
  notes: "Transcribed the mathematical definitions of TopoAE, counterexample to higher-dimensional TopoAE naive extension, Cascade Distortion loss formulation, and the geometric 2D Rips persistent homology algorithm steps."
topics:
  - "[Persistent Homology](../concepts/persistent-homology.md)"
  - "[Topological Autoencoders](../concepts/topological-autoencoders.md)"
methods:
  - "[TopoAE++](../methods/topoae-plus-plus.md)"
  - "[Cascade Distortion](../methods/cascade-distortion.md)"
cites: []
cited_by: []
era: "2020s"
relevance: high
relevance_note: "Directly improves Topological Autoencoders to preserve cyclic structures (PH1), which is critical for periodic or cyclic features in Scanning Tunneling Spectroscopy spatial-spectral grids."
tags:
  - paper
---

## Summary

This paper presents **TopoAE++**, a topology-aware dimensionality reduction method designed to accurately visualize cyclic structures in high-dimensional data by preserving 1-dimensional persistent homology ($\mathrm{PH}^1$). It builds on the Topological Autoencoders (TopoAE) framework, providing a novel theoretical analysis showing that a zero TopoAE loss preserves 0-dimensional persistence ($\mathrm{PH}^0$) pairs, but proving that a naive extension of this loss fails for higher dimensions. To address this, the authors introduce **cascade distortion** ($\mathcal{L}_{\text{CD}}^1$), a regularization term that constrains the lengths of all edges in the 2-chains filling the persistent 1-cycles. They also present a fast, purely geometric algorithm to compute $\mathrm{PH}^1$ for Rips filtrations in the plane, accelerating computation by two orders of magnitude and making the optimization loop highly efficient.

## Key Contributions

1. **Theoretical Validation of TopoAE Loss**: Proves that a zero 0-dimensional TopoAE loss ($\mathcal{L}_{\text{TAE}}^0 = 0$) guarantees identical $\mathrm{PH}^0$ diagrams between the high-dimensional input and low-dimensional representation.
2. **Identification of Higher-Dimensional Failure Case**: Provides a concrete counter-example showing that a naive extension of critical-edge length matching ($\mathcal{L}_{\text{TAE}}^1$) fails to preserve $\mathrm{PH}^1$ persistence diagrams.
3. **Cascade Distortion Loss**: Introduces $\mathcal{L}_{\text{CD}}^d$ to penalize distortion over the entire simplicial chain (global cascade skeleton) rather than just the birth/death critical edges, ensuring cycles are embedded isometrically without self-intersections.
4. **Fast planar $\mathrm{PH}^1$ Algorithm**: Proposes a geometric, matrix-reduction-free algorithm to compute persistent homology in $\mathbb{R}^2$ in near-linear time using relative neighborhood graphs (RNG) and minmax length triangulations.
5. **C++ Implementation**: Provides a high-performance open-source implementation integrated with the Topology ToolKit (TTK).

## Method Details

Given an input point cloud $X \subset \mathbb{R}^h$ and its visual representation $Z = \operatorname{enc}(X) \subset \mathbb{R}^2$, the autoencoder minimizes a joint loss:
$$\mathcal{L} = \mathcal{L}_r + \lambda \mathcal{L}_{\text{CD}}^1(X, Z)$$
where $\mathcal{L}_r = \|\operatorname{dec}(\operatorname{enc}(X)) - X\|^2$ is the standard mean squared reconstruction error, and $\mathcal{L}_{\text{CD}}^1$ is the 1-dimensional cascade distortion term.

### Cascade Distortion Formulation
The global cascade skeleton $\operatorname{GCS}^d(X)$ is defined as the set of all edges appearing in the cascades of any positive persistence $\mathrm{PH}^k$ pair (for $0 \le k \le d$):
$$\operatorname{GCS}^d(X) = \bigcup_{k=0}^d \bigcup_{(\tau, \sigma) \in \mathcal{P}^k} \operatorname{cascade}[\sigma]^{(1)}$$
The Cascade Distortion loss $\mathcal{L}_{\text{CD}}^d$ is formulated as:
$$\mathcal{L}_{\text{CD}}^d(X, Z) = \|A^X[\operatorname{GCS}^d(X)] - A^Z[\operatorname{GCS}^d(X)]\|_2^2 + \|A^Z[\pi^d(Z)] - A^X[\pi^d(Z)]\|_2^2$$
where:
*   The first term enforces an isometric embedding of input cycles and the 2-chains filling them.
*   The second term pushes away vertices in $Z$ that would create spurious, non-existent cycles in the visual projection.

### Fast 2D Rips Homology Algorithm
To compute $\mathrm{PH}^0$ and $\mathrm{PH}^1$ for Rips filtrations of $Z \subset \mathbb{R}^2$ at each optimization step:
1.  Compute the Delaunay triangulation $\operatorname{DEL}(Z)$ and the Urquhart graph $\operatorname{UG}(Z)$.
2.  Compute the Euclidean minimum spanning tree $\operatorname{MST}(Z)$ from $\operatorname{UG}(Z)$ via Kruskal's algorithm to obtain the 0-dimensional diagram $\mathcal{D}^0_{\text{Rips}}(Z)$.
3.  Compute the Relative Neighborhood Graph $\operatorname{RNG}(Z)$ by pruning edges in $\operatorname{UG}(Z) \setminus \operatorname{MST}(Z)$ that have non-empty lenses.
4.  For each polygon formed by the $\operatorname{RNG}(Z)$ cycle boundaries, locate the longest edge of its minmax length (MML) triangulation (this edge kills the corresponding $\mathrm{PH}^1$ class).
5.  Construct a dual graph where nodes represent RNG-polygons with filtration value $-\delta_{\text{MML}}$, and edges represent cycle-creating edges with filtration value $-|e|$, then run Kruskal's algorithm to pair them and extract $\mathcal{D}^1_{\text{Rips}}(Z)$.

## Theoretical Results

*   **Lemma 1 (Wasserstein bound for TopoAE)**:
    For any point clouds $X$ and $Z$ of equal size:
    $$\mathcal{W}_2(\mathcal{D}^0_{\text{Rips}}(X), \mathcal{D}^0_{\text{Rips}}(Z))^2 \le \mathcal{L}^0_{\text{TAE}}(X, Z)$$
    Moreover, under general position, if $\mathcal{L}^0_{\text{TAE}}(X, Z) = 0$, then $\operatorname{MST}(X) = \operatorname{MST}(Z)$.

*   **Lemma 2 (Equivalence at $d=0$)**:
    For any point cloud $X$, $\operatorname{GCS}^0(X) = \operatorname{MST}(X)$, which implies:
    $$\mathcal{L}^0_{\text{TAE}}(X, Z) = \mathcal{L}^0_{\text{CD}}(X, Z)$$

*   **Lemma 3 (RNG intersection rule)**:
    In the plane, an edge that intersects an RNG edge kills no $\mathrm{PH}^1$ class of positive persistence.

*   **Lemma 4 (Triangulation killer rule)**:
    Under general position, the longest edge $e_{\text{MML}}$ of length $\delta_{\text{MML}}$ of any minmax length triangulation of an RNG-polygon $\Pi$ kills the $\mathrm{PH}^1$ class $\gamma$ represented by $\Pi$.

*   **Lemma 5 (Boundary relationship)**:
    In the plane, the minmax length triangulation edge length $\delta_{\text{MML}}$ and the longest Delaunay edge $e_{\text{Del}}$ inside an RNG-polygon satisfy:
    $$\frac{\sqrt{3}}{2} \delta_{\text{Del}} \le \delta_{\text{MML}} \le \delta_{\text{Del}}$$

## Relation to Our Work

This paper is highly relevant to spectroscopic and spatial characterizations in STM. STS grids ($x \times y \times V$) frequently exhibit cyclic patterns or periodic variations due to interference (e.g., Friedel oscillations or standing waves around defects/step edges). Standard autoencoders or TopoAE compress these grids but often fail to preserve the continuity of these quantum interference loops or spatial periodicities in 2D projections. Using TopoAE++ and its cascade distortion term guarantees that spatial-spectral standing waves and electronic density loops are mapped isometrically to visual layouts without tearing or self-intersecting.

## Limitations

1.  **Planar Constraint for Acceleration**: The fast $\mathrm{PH}^1$ algorithm relies on planar duality and Delaunay triangulation, meaning it is strictly limited to low-dimensional visual spaces ($Z \subset \mathbb{R}^2$).
2.  **Computational Complexity of Cascades in High Dimensions**: Computing the global cascade skeleton $\operatorname{GCS}^d(X)$ for high-dimensional point clouds $X \subset \mathbb{R}^h$ requires tracking chain cascades during reduction, which can become memory-intensive for large datasets.
3.  **Optimization Local Minima**: The topological regularization term can sometimes trap the network in bad local minima. This requires random restarts or smart initializations (e.g., using UMAP first).

## Selected Equations

*   **Eq. (2) Rips Complex**:
    $$\operatorname{Rips}_r(X) = \{\sigma \subset X \mid \delta(\sigma) \le r\}$$

*   **Eq. (5) Naive $d$-dimensional TopoAE Loss**:
    $$\mathcal{L}_{\text{TAE}}^d = \|A^X[\pi^d(X)] - A^Z[\pi^d(X)]\|_2^2 + \|A^Z[\pi^d(Z)] - A^X[\pi^d(Z)]\|_2^2$$

*   **Eq. (8) Global Cascade Skeleton**:
    $$\operatorname{GCS}^d(X) = \bigcup_{k=0}^d \bigcup_{(\tau, \sigma) \in \mathcal{P}^k} \operatorname{cascade}[\sigma]^{(1)}$$

*   **Eq. (9) Cascade Distortion Loss**:
    $$\mathcal{L}_{\text{CD}}^d(X, Z) = \|A^X[\operatorname{GCS}^d(X)] - A^Z[\operatorname{GCS}^d(X)]\|_2^2 + \|A^Z[\pi^d(Z)] - A^X[\pi^d(Z)]\|_2^2$$
