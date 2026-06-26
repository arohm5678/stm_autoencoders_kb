---
type: open-questions
tags:
  - nav
---

# Open Questions

Running list of unresolved questions and gaps surfaced while researching and ingesting papers on Autoencoders for STM:

### 🗺️ Latent Space Interpretability
* How can latent dimensions of Variational Autoencoders (VAEs) be deterministically mapped or regularized to represent physical variables (e.g., tip-sample distance, local work function, localized density states) rather than abstract statistical features?
* What loss constraints can enforce physical symmetries (e.g., lattice rotation, translation) in the latent space?

### ⚡ Generalization and Noise Transfer
* How do Denoising Autoencoders (DAEs) trained on synthetic noise profiles generalize to diverse real-world experimental artifacts like tip state changes, thermal drift, and grid jumps?
* Can we build instrument-agnostic representation models, or must they be retrained per instrument/tip geometry?

### 📊 Quantifying Reconstruction Uncertainty
* How do we quantify the uncertainty of deep reconstruction models (like inverting sparse scans or denoising $dI/dV$ grids)? Can Bayesian neural networks or ensemble autoencoders be integrated?
