---
type: method
title: "JARVIS-STMnet"
aliases: []
category: neural
introduced_in: "[Choudhary (2021)](../papers/choudhary-2021-stm-db.md)"
parent_methods: []
child_methods: []
related_methods: []
key_papers:
  - "[Choudhary (2021)](../papers/choudhary-2021-stm-db.md)"
complexity: ""
convergence_rate: ""
tags:
  - method
  - machine-learning
  - cnn
  - classification
---

## Overview

JARVIS-STMnet is a deep convolutional neural network (CNN) model developed to classify simulated and experimental STM images of 2D materials into one of the five 2D Bravais lattice classes: hexagonal, square, rhombus/centered-rectangle, rectangle, and parallelogram/oblique.

## Algorithm

The network architecture is structured as follows:

```
Input Image (64x64, binarized grayscale)
  ↓
Conv2D (16 filters, 3x3 kernel, ReLU)
  ↓
MaxPool2D (2x2 pool)
  ↓
Conv2D (32 filters, 3x3 kernel, ReLU)
  ↓
MaxPool2D (2x2 pool)
  ↓
Conv2D (48 filters, 3x3 kernel, ReLU)
  ↓
MaxPool2D (2x2 pool)
  ↓
Conv2D (64 filters, 3x3 kernel, ReLU)
  ↓
MaxPool2D (2x2 pool)
  ↓
Dense (600 nodes, ReLU)
  ↓
Dropout (20% rate)
  ↓
Dense Softmax (5 outputs)
```

### Preprocessing and Ingestion Workflow
1.  **Binarization**: Grayscale constant-height STM images are thresholded at a pixel value of 170 (out of 255) to highlight atomic features.
2.  **Resizing**: Images are scaled to $64 \times 64$ pixels.
3.  **Data Augmentation**: To avoid overfitting, images are augmented using random rotations, vertical and horizontal flips, and zoom operations.
4.  **Optimization**: The network is trained using the ADAM optimizer with sparse categorical crossentropy loss.

## Advantages / Limitations

### Advantages
*   **Fast Classification**: Can classify lattice types in milliseconds once trained, bypassing tedious manual crystallography checks.
*   **Generalizability**: Shows decent generalizability to real experimental images without prior training on experimental data.

### Limitations
*   **Input Preprocessing Dependent**: Relies on binarization at a hardcoded threshold of 170, which may not generalize well to experimental images with varying noise or background levels.
*   **Limited to Bravais Lattices**: Only identifies the Bravais lattice type (5 classes) rather than the full plane group or space group.
