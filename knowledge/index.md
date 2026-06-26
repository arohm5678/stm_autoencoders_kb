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

### 3. Autoencoder Architectures & Methods
* **Convolutional Autoencoders (CAEs)**: Spatial feature extraction for topographic STM images.
* **Variational Autoencoders (VAEs)**: Probabilistic models for latent clustering and physical parameter decoupling.
* **Denoising Autoencoders (DAEs)**: Reconstruction models trained with synthetic or experimental noise.
* **Physics-Informed/Physics-Guided Autoencoders (PIAEs)**: Models utilizing custom loss functions incorporating tunneling theory.

---

## 📝 Recent Syntheses & Debates
* *No synthesis pages created yet. Populate as you ingest papers.*

---

## 📚 Master Bibliography
* Refer to [Master BibTeX](references.bib) for complete citation keys.
* Individual paper summaries are placed in the `papers/` folder.
