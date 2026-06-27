---
type: paper
title: "Computational scanning tunneling microscope image database"
authors:
  - "Kamal Choudhary"
  - "Kevin F. Garrity"
  - "Charles Camp"
  - "Sergei V. Kalinin"
  - "Rama Vasudevan"
  - "Maxim Ziatdinov"
  - "Francesca Tavazza"
year: 2021
venue: "Scientific Data"
venue_type: journal
doi: "10.1038/s41597-021-00824-y"
arxiv: ""
pdf: "raw/pdfs/stm-images/choudhary-2021-stm-db.pdf"
bibtex_key: choudhary2021computational
status: ingested
date_ingested: 2026-06-27
source_trace:
  pages_read: "1-9"
  transcription_method: "read-tool"
  date_read: 2026-06-27
  notes: "Transcribed the mathematical definitions of STM simulation (Tersoff-Hamann method), tunneling current formulation, VASP computational setup, and CNN architecture for Bravais lattice classification."
topics:
  - "[STM Image Simulation](../concepts/stm-image-simulation.md)"
methods:
  - "[Tersoff-Hamann Method](../methods/tersoff-hamann.md)"
  - "[JARVIS-STMnet](../methods/jarvis-stmnet.md)"
cites: []
cited_by: []
era: "2020s"
relevance: high
relevance_note: "Creates the first systematic database of 2D material STM images using DFT (716 materials, 5 Bravais lattices), providing a key resource for training ML classifiers and autoencoders."
tags:
  - paper
---

## Summary

This paper introduces the first systematic database of simulated scanning tunneling microscope (STM) images for 2D materials. Using density functional theory (DFT) and the Tersoff-Hamann approximation, the authors computationally generate constant-height and constant-current STM images for 716 exfoliable 2D materials (with exfoliation energies $< 200\text{ meV/atom}$). All data is made available publicly through the JARVIS-STM database (`https://jarvis.nist.gov/jarvisstm`). Additionally, the authors demonstrate an application of this dataset by training a convolutional neural network (CNN) model to classify the five 2D Bravais lattices from STM images, achieving 90% classification accuracy on the test set and showing that the model can successfully generalize to real experimental images.

## Key Contributions

1. **First Computational STM Database**: Systematically generated simulated STM images for 716 2D materials, filling the gap of standardized reference images for STM analysis.
2. **JARVIS-STM Portal**: Made the constant-height and constant-current DFT-STM images, along with raw calculations (e.g., VASP `PARCHG` files), publicly available for downstream tasks.
3. **JARVIS-STMnet Classifier**: Developed a deep learning classifier to identify Bravais lattices directly from STM images, obtaining 90% test accuracy.
4. **Generalization to Experimental Data**: Validated the model on 9 experimental STM images from the literature (graphene, $2\text{H-MoS}_2$, $2\text{H-NbSe}_2$, $2\text{H-WSe}_2$, $1\text{T}'\text{-WTe}_2$, $\text{FeSe}$, black phosphorus, $\text{SnSe}$, and bismuth), correctly predicting the Bravais lattice for 7 of them.

## Method Details

### DFT Simulation Setup
- **Software**: Vienna *ab initio* simulation package (VASP) using the Projector Augmented-Wave (PAW) formalism.
- **Exchange-Correlation**: vdW-DF-OptB88 functional to account for van der Waals interactions consistently across 2D and 3D datasets.
- **Vacuum**: At least $20\text{ \AA}$ vacuum in the $z$-direction is used to prevent spurious self-interactions.
- **Convergence**: Force convergence is set to $10^{-6}\text{ eV}$ and energy convergence is set to $0.001\text{ eV/\AA}$ (as printed in the text).
- **STM Simulation**: Constant-height mode (CHM) and constant-current mode (CCM) are simulated using the Tersoff-Hamann approximation, assuming an $s$-wave non-functionalized STM tip.
- **Simulation Conditions**:
  - Positive bias: $+0.5\text{ eV}$
  - Negative bias: $-0.5\text{ eV}$
  - Heights: Simulated at $2\text{ \AA}$ and $3\text{ \AA}$ above the highest atom in the cell.
  - Repeating unit cells: The cells are repeated to be at least $20\text{ \AA}$ long in the $xy$-plane.

### Machine Learning Classification (JARVIS-STMnet)
- **Input preprocessing**: Constant-height STM images are converted to grayscale and binarized with a pixel threshold of 170 (out of 255) to detect atomic features. Binarized images are resized to $64 \times 64$ pixels.
- **Dataset Augmentation**: The original dataset is augmented using random rotations, flipping, zooming in, and zooming out, yielding a total of 53,508 images (at least 10,000 per Bravais lattice class).
- **Network Architecture**: 
  - 4 convolutional layers (16, 32, 48, and 64 feature-maps; kernel size $3 \times 3$).
  - 4 max-pooling layers (pool size $2 \times 2$) with ReLU activation.
  - Fully connected layer with 600 nodes and ReLU activation.
  - Dropout layer (20% rate).
  - Softmax output layer (5 units corresponding to the 5 Bravais lattices: hexagonal, square, rhombus/centered-rectangle, rectangle, and parallelogram/oblique).
- **Training**: Optimized using ADAM with sparse categorical crossentropy loss, using a 90%-10% train-test split and early stopping.

## Theoretical Results

- **Validation of Tersoff-Hamann Model**: The tunneling current $I(r, V)$ is proportional to the integrated local density of states (ILDOS) of the sample.
- **Bravais Lattice Distribution**: Most 2D materials in the database are hexagonal, followed by rectangular and square lattices.
- **Effect of Simulation Height**: For $2\text{H-MoTe}_2$, increasing the tip height from $3\text{ \AA}$ to $5\text{ \AA}$ preserves the hexagonal symmetry pattern but causes slight changes around the atoms as the tip probes different layers of charge density.

## Relation to Our Work

This paper provides the foundational data needed to develop autoencoders for STM. Since spatial-spectral STM images (or STS maps) contain complex atomic patterns mixed with experimental noise, a pre-trained binarization classifier or an autoencoder trained on the JARVIS-STM database can serve as a powerful feature extractor. Moreover, binarized constant-height STM images from this database can serve as clean, noise-free targets to train denoising autoencoders or coordinate-based networks for experimental data.

## Limitations

1. **Tip Modeling**: Assumes a simple, non-functionalized $s$-wave tip (Tersoff-Hamann method), ignoring tip geometry, tip-sample interactions, or functionalization (e.g., CO-tip), which can significantly alter experimental STM contrasts.
2. **Defect-Free Systems**: The database only contains perfect, defect-free 2D materials. Real-world experimental STM images are heavily dominated by defects, grain boundaries, and step edges.
3. **No Thermal Noise**: Simulated images do not incorporate thermal fluctuations or drift, which are common in room-temperature or low-temperature experimental STM measurements.

## Selected Equations

*   **Eq. (1) Local Charge Density**:
    $$n(r, E) = \sum_{\mu} |\psi_{\mu}(r)|^2 \delta(\epsilon_{\mu} - E)$$

*   **Eq. (2) Tunneling Current**:
    $$I(r, V) \propto \int_{E_F}^{E_F + eV} dE \, n(r, E)$$

## Claims Made

*   **Computational STM image database for 2D materials** ([computational-stm-database](../claims/computational-stm-database.md)): Introduced a systematic computational database of STM images for 716 exfoliable 2D materials using VASP and the Tersoff-Hamann method. [Supported; numerical]
*   **Automated Bravais lattice classification from STM images** ([automated-bravais-lattice-classification](../claims/automated-bravais-lattice-classification.md)): Trained a CNN classifier (JARVIS-STMnet) that achieves 90% accuracy in classifying the five 2D Bravais lattices from simulated STM images. [Supported; numerical]
*   **Generalizability of synthetic STM trained models** ([synthetic-stm-generalization](../claims/synthetic-stm-generalization.md)): Models trained purely on simulated, noise-free STM images can classify the Bravais lattices of real experimental images with high reliability (7 out of 9 tested cases correct). [Supported; empirical]

