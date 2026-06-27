---
type: index
tags:
  - nav
---

# Index — Autoencoders for STM

Top-level map of the knowledge base for **Autoencoders in Scanning Tunneling Microscopy (STM)**. This vault organizes research at the intersection of deep unsupervised representation learning and nanoscale surface characterization.

## 📂 Core Navigation
* [Chronological Timeline](timeline.md)
* [Append-only Operation Log](log.md)
* [Active Reading List](reading-list.md)
* [Open Questions & Research Gaps](open-questions.md)
* [Cross-Domain Connections](connections.md)

---

## 🔬 Domain Taxonomy

### 1. Problem Classes & Applications
* **Spectroscopic Denoising & Filtering**: Reducing noise in $dI/dV$ curves and spectral grids.
* **Spatially Resolved Feature Extraction**: Compressing spatial-spectral maps of electronic density of states.
* **Anomaly & Defect Detection**: Unsupervised identification of atomic vacancies, adatoms, and step edges.
* **Super-Resolution & Reconstruction**: Infilling undersampled or noisy STM topography.

### 2. Foundational Concepts
* **Latent Space Interpretation**: Mapping latent variables to physical parameters (e.g., work function, local DOS).
* **Physics-Informed Regularization**: Enforcing physical constraints (e.g., tunneling current equations, symmetry) on the latent space or reconstructions.
* **Scanning Tunneling Spectroscopy (STS) Grids**: High-dimensional datasets ($x \times y \times V$) representing local density of states.
* **[Bernstein Inequality](concepts/bernstein-inequality.md)**: Probability bound incorporating variance, used to establish convergence bounds.
* **[Persistent Homology](concepts/persistent-homology.md)**: Multi-scale topological feature analysis (clusters, cycles) of point clouds.
* **[Topological Autoencoders](concepts/topological-autoencoders.md)**: Regularization models to preserve homology structures during dimensionality reduction.
* **[STM Image Simulation](concepts/stm-image-simulation.md)**: DFT-based computational generation of STM images.
* **[Variational Autoencoders](concepts/variational-autoencoders.md)**: Probabilistic latent-variable models coupling deep networks with variational inference.
* **[Evidence Lower Bound](concepts/evidence-lower-bound.md)**: Mathematical optimization objective for variational inference.
* **[Normalizing Flows](concepts/normalizing-flows.md)**: Density estimation via sequences of invertible transformations.

### 3. Autoencoder Architectures & Methods
* **Convolutional Autoencoders (CAEs)**: Spatial feature extraction for topographic STM images.
* **Variational Autoencoders (VAEs)**: Probabilistic models for latent clustering and physical parameter decoupling.
* **Denoising Autoencoders (DAEs)**: Reconstruction models trained with synthetic or experimental noise.
* **Physics-Informed/Physics-Guided Autoencoders (PIAEs)**: Models utilizing custom loss functions incorporating tunneling theory.
* **[Adaptive Partitioning](methods/adaptive-partitioning.md)**: Dynamic tree-structured spatial splitting to adaptively learn function features.
* **[TopoAE++](methods/topoae-plus-plus.md)**: Cycle-aware topology-preserving autoencoders with fast planar solvers.
* **[Cascade Distortion](methods/cascade-distortion.md)**: Isometric cycle-preserving loss constraining the global cascade skeleton.
* **[Tersoff-Hamann Method](methods/tersoff-hamann.md)**: Classical s-wave tunneling current approximation for STM simulation.
* **[JARVIS-STMnet](methods/jarvis-stmnet.md)**: Convolutional neural network for Bravais lattice classification from STM images.
* **[Reparameterization Trick](methods/reparameterization-trick.md)**: Method to make stochastic nodes differentiable for backpropagation.
* **[Inverse Autoregressive Flow](methods/inverse-autoregressive-flow.md)**: Autoregressive normalizing flow for high-dimensional spaces.

---

## 📝 Recent Syntheses & Debates
* *No synthesis pages created yet. Populate as you ingest papers.*

---

## 📚 Master Bibliography
* **[Choudhary (2021)](papers/choudhary-2021-stm-db.md)**: Computational scanning tunneling microscope image database.
* **[Kingma (2019)](papers/kingma-2019-vae-intro.md)**: An Introduction to Variational Autoencoders.
* Refer to [Master BibTeX](references.bib) for complete citation keys.
* Individual paper summaries are placed in the `papers/` folder.


