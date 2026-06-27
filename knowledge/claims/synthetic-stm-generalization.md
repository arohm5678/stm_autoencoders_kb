---
type: claim
title: "Generalizability of Synthetic STM Trained Models"
statement: "Machine learning models trained purely on simulated, noise-free STM images can generalize to classify the structures of real experimental STM images."
claim_type: empirical
status: supported
source_paper: "choudhary2021computational"
source_location: "Technical Validation, p.3-5"
evidence:
  - "[Choudhary (2021)](../papers/choudhary-2021-stm-db.md) (Sec Technical Validation, p.3-5)"
counter_evidence: []
related_claims:
  - "[Automated Bravais Lattice Classification](../claims/automated-bravais-lattice-classification.md)"
related_debates: []
confidence: medium
tags:
  - claim
  - machine-learning
  - generalizability
  - experimental-validation
---

## Statement

Machine learning models trained purely on simulated, noise-free STM images (synthetic data) can generalize to classify the structures (such as Bravais lattices) of real experimental STM images despite differences in noise, tip geometry, and experimental setups.

## Evidence

*   **[Choudhary (2021)](../papers/choudhary-2021-stm-db.md)**: Tested the JARVIS-STMnet CNN (trained on synthetic DFT images) on 9 experimental STM images from the literature. The model correctly classified the Bravais lattice class for 7 out of the 9 experimental images (graphene, $2\text{H-MoS}_2$, $2\text{H-NbSe}_2$, $2\text{H-WSe}_2$, $1\text{T}'\text{-WTe}_2$, $\text{FeSe}$, and black phosphorus), while misclassifying $1\text{T}'\text{-MoTe}_2$ and $\text{SnSe}$.

## Counter-Evidence

None, although the failure on 2 of the 9 cases highlights limitations due to factors like experimental noise, tip geometry, and sample defects.

## Assessment

The claim is empirically supported but with medium confidence, as the evaluation on real-world experimental images is limited to a small sample size ($n=9$) and resulted in a 78% success rate (7/9). Further large-scale validation is needed to assess how generalizable synthetic models are to highly noisy or defective experimental surfaces.
