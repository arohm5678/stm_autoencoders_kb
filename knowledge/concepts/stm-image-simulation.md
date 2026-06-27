---
type: concept
title: "STM Image Simulation"
aliases:
  - "Scanning Tunneling Microscopy Simulation"
  - "DFT STM Simulation"
category: physics-simulation
first_appearance: 1983
key_equation: ""
parent_concepts: []
child_concepts: []
related_concepts: []
key_papers:
  - "[Choudhary (2021)](../papers/choudhary-2021-stm-db.md)"
tags:
  - concept
  - stm
  - simulation
---

## Definition

STM Image Simulation refers to the computational modeling and generation of scanning tunneling microscope (STM) images of material surfaces. It uses quantum mechanical methods, typically Density Functional Theory (DFT), to compute the electronic structure and charge density of a surface and simulate the tunneling current flowing between an STM tip and the sample.

## Mathematical Formulation

The most common approximation is the Tersoff-Hamann method, where the tunneling current $I(r, V)$ at tip position $r$ and bias voltage $V$ is proportional to the integrated local density of states (ILDOS):
$$I(r, V) \propto \int_{E_F}^{E_F + eV} n(r, E) \, dE$$
where $n(r, E)$ is the local density of states of the sample at the tip position.

## Key Properties

*   **Constant-Height Mode (CHM)**: The tip height $z$ is kept constant, and spatial variations in tunneling current are mapped.
*   **Constant-Current Mode (CCM)**: The tunneling current is kept constant, and the vertical feedback position $z(x, y)$ of the tip is mapped, producing a topographic profile.
*   **Reference Standards**: Simulated STM images represent perfect, defect-free structures, providing standard reference images for experimental identification.

## Historical Context

Simulating STM images began shortly after the invention of the scanning tunneling microscope in 1981 by Gerd Binnig and Heinrich Rohrer. J. Tersoff and D. R. Hamann proposed the first quantitative model in 1983 to calculate the tunneling current.

## Connections

*   Method: "[Tersoff-Hamann Method](../methods/tersoff-hamann.md)"
*   Paper: "[Choudhary (2021)](../papers/choudhary-2021-stm-db.md)"
