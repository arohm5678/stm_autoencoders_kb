---
type: claim
title: "Computational STM Database for 2D Materials"
statement: "A systematic database of computational STM images generated using density functional theory (DFT) and the Tersoff-Hamann approximation can be constructed for exfoliable 2D materials."
claim_type: methodological
status: supported
source_paper: "choudhary2021computational"
source_location: "Background & Summary, p.1-2"
evidence:
  - "[Choudhary (2021)](../papers/choudhary-2021-stm-db.md) (Sec Background & Summary, p.1-2)"
counter_evidence: []
related_claims: []
related_debates: []
confidence: high
tags:
  - claim
  - stm-images
  - dft
---

## Statement

A systematic database of computational scanning tunneling microscope (STM) images generated using density functional theory (DFT) and the Tersoff-Hamann approximation can be constructed for exfoliable 2D materials, providing standard reference images for nanostructural characterization.

## Evidence

*   **[Choudhary (2021)](../papers/choudhary-2021-stm-db.md)**: Computed constant-height and constant-current STM images for 716 exfoliable 2D materials (with exfoliation energies $< 200\text{ meV/atom}$) using VASP, vdW-DF-OptB88, and the Tersoff-Hamann approximation. The dataset is hosted in the JARVIS-STM database.

## Counter-Evidence

None.

## Assessment

The claim is fully supported. The JARVIS-STM database contains images and the raw charge density files (VASP `PARCHG` files) for hundreds of 2D materials, demonstrating the viability of high-throughput computational STM image generation.
