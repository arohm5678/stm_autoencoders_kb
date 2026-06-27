---
type: claim
title: "Automated Bravais Lattice Classification from STM Images"
statement: "Deep convolutional neural networks can classify the five 2D Bravais lattices from binarized constant-height STM images with high accuracy."
claim_type: methodological
status: supported
source_paper: "choudhary2021computational"
source_location: "Methods, p.2-3"
evidence:
  - "[Choudhary (2021)](../papers/choudhary-2021-stm-db.md) (Sec Methods, p.2-3)"
counter_evidence: []
related_claims:
  - "[Synthetic STM Generalization](../claims/synthetic-stm-generalization.md)"
related_debates: []
confidence: high
tags:
  - claim
  - machine-learning
  - classification
  - bravais-lattices
---

## Statement

Deep convolutional neural networks (CNNs) can classify the five 2D Bravais lattices (hexagonal, square, rhombus/centered-rectangle, rectangle, and parallelogram/oblique) from binarized constant-height STM images with high accuracy.

## Evidence

*   **[Choudhary (2021)](../papers/choudhary-2021-stm-db.md)**: Trained a 4-layer CNN (JARVIS-STMnet) on 53,508 augmented, binarized constant-height simulated STM images. The model achieved 90.1% accuracy on the validation set and 90.0% accuracy on the test set.

## Counter-Evidence

None.

## Assessment

The claim is strongly supported by numerical experiments on a large, balanced, and augmented dataset of simulated STM images.
