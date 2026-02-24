# VibronicDimerResponse

Optical Response Calculation Package for a Vibronic Dimer

**Author:** Jonathan D. Schultz  
**Email:** jonathanschultz2022@u.northwestern.edu  
**Last revision date:** February 1st, 2021  
**Copyright:** Jonathan D. Schultz, 2021

---

## Project Overview

This package simulates the linear and two-dimensional (2D) electronic spectroscopy of a molecular dimer described by the Frenkel exciton model with vibronic (vibrational-electronic) coupling. The model is based on a Holstein-type Hamiltonian where each molecule has a single harmonic vibrational mode linearly coupled to its electronic excited state.

The package computes:
- The **first-order optical response** (linear absorption spectrum)
- The **third-order optical response** (2D electronic spectrum) via the sum-over-states approach

This package was designed with physical chemistry pedagogy in mind. The model relies on several assumptions, but not so many as to diminish the practical value of the simulations. This package remains comparable to several models that are currently employed in the literature. The goal of this package is to help bridge the gap between often oversimplified textbook code examples and, if even made available, the rigorous codes published in current literature.

---

## Requirements

- **MATLAB** (R2016b or later recommended)
- No external toolboxes required

---

## Quick Start / How to Run

1. Clone or download this repository.
2. Open MATLAB and navigate to the repository root directory.
3. Open `MDS_tindpt.m`.
4. Run each section sequentially (using *Run Section* or `Ctrl+Enter`):
   - **Section 1:** Defines physical parameters and builds the Hamiltonian.
   - **Section 2:** Computes and plots the linear absorption spectrum.
   - **Section 3:** Computes the third-order response functions.
   - **Section 4:** Transforms to the frequency domain and plots the 2D spectrum.

The `addpath` calls at the top of `MDS_tindpt.m` automatically add `core/` and `utils/` to the MATLAB path so all functions are found transparently.

---

## Parameter Reference

All physical parameters are set in `MDS_tindpt.m` via the `Par` struct:

| Field | Description | Units | Typical Value |
|-------|-------------|-------|---------------|
| `Par.c` | Speed of light | cm/fs | `2.9979e-5` |
| `Par.e1` | Center energy of local excited electronic state for molecule 1 | cm⁻¹ | `17000` |
| `Par.e2` | Center energy of local excited electronic state for molecule 2 | cm⁻¹ | `17000` |
| `Par.w0` | Vibrational frequency coupled to electronic state | cm⁻¹ | `1300` |
| `Par.J` | Dipolar coupling between molecules | cm⁻¹ | `200` |
| `Par.lambda` | Linear vibronic coupling; Huang-Rhys parameter = lambda² | dimensionless | `sqrt(0.6)` |
| `Par.v_max` | Maximum vibrational quanta included in Hamiltonian | integer | `3` |

---

## File / Module Map

```
/
├── README.md               - this file
├── LICENSE                 - MIT license
├── .gitignore              - standard MATLAB .gitignore
├── MDS_tindpt.m            - central runner script (start here)
├── core/
│   ├── DimHamGen.m         - Hamiltonian and transition dipole operator generation
│   ├── vibcre.m            - vibrational annihilation operator
│   ├── elcre.m             - electronic annihilation operator
│   ├── vibron_zero_exc.m   - ground-state (zero-excitation) basis set
│   ├── vibron_single_exc.m - single-excitation basis set
│   └── vibron_double_exc.m - double-excitation basis set
└── utils/
    ├── MDplot.m            - 2D spectrum plotting
    ├── cmap2d.m            - diverging blue-white-red colormap generator
    └── normdim.m           - normalize array by absolute maximum
```

---

## Structure Conventions

Throughout `MDS_tindpt.m`, three structs organize the workspace:

- **`Par`** — Physical parameters (see Parameter Reference above).
- **`FEH`** — Frenkel-Exciton Hamiltonian. Contains all outputs of `DimHamGen`, including Hamiltonian blocks (`Hgg`, `Hse`, `Hde`), transition dipole operators (`MUg_se`, `MUse_g`, etc.), and basis/eigenvector information.
- **`Res`** — Response. Contains time and frequency axes, pre-allocated response function arrays (`R1_t1t3`, etc.), propagators, and frequency-domain results.

---

## Output Description

Running `MDS_tindpt.m` produces two figures:

1. **Linear absorption spectrum** — plots the normalized first-order response as a function of frequency (cm⁻¹), showing the vibronic progression of the dimer.

2. **2D electronic spectrum** — a filled contour plot of the real part of the total third-order response as a function of excitation (ω₁) and detection (ω₃) frequencies. A diagonal line (ω₁ = ω₃) is drawn for reference. Positive features (red) correspond to ground-state bleach and stimulated emission; negative features (blue) correspond to excited-state absorption.

---

## Response Pathway Descriptions

The third-order response is computed as a sum of four Liouville pathways:

| Pathway | Type | Description |
|---------|------|-------------|
| **R1** | Non-rephasing ground state bleach (GSB) | Population remains in ground state during T₂; ω₁ and ω₃ have the same sign |
| **R2** | Rephasing stimulated emission (SE) | System emits from singly-excited state; ω₁ and ω₃ have opposite signs (rephasing) |
| **R3** | Rephasing ground state bleach (GSB) | Ground-state pathway; ω₁ and ω₃ have opposite signs (rephasing) |
| **R4** | Non-rephasing stimulated emission (SE) | System emits from singly-excited state; ω₁ and ω₃ have the same sign |

---

## Known Limitations / Model Assumptions

- **Phenomenological dephasing:** Coherence decay is modeled by exponential damping (`exp(-t/Tdeph)`) rather than a microscopic bath model.
- **No thermal distribution:** The initial state is assumed to be the ground vibronic state (zero temperature).
- **Time-independent Hamiltonian:** Nuclear motion is not explicitly propagated; the Hamiltonian is static.
- **Truncated vibrational basis:** Only states with total vibrational quanta ≤ `v_max` are included. Convergence should be checked by increasing `v_max`.
- **Equal transition dipole moments:** Both molecules are assigned unit transition dipole strength (`mu1E = mu2E = 1`).

---

## Citation

If you use this package in your research, please cite the author:

> Jonathan D. Schultz, *Vibronic-Exciton-Optical-Response*, 2021. https://github.com/jonathanschultzNU/Vibronic-Exciton-Optical-Response

