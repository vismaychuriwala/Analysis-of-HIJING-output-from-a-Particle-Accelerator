# Analysis of HIJING output from a Particle-Accelerator

This repository contains code for the **fully automated analysis of HIJING output** from a particle accelerator. The project utilizes **Linux**, **Bash**, and **ROOT** to automate data analysis over a typical HIJING dataset, generated from 10 separate jobs on a local batch farm.

The dataset corresponds to **HIJING model predictions** for **Pb-Pb heavy-ion collisions** at a center-of-mass energy of **2.76 TeV**, as used in **LHC Run 1 (2009–2013)**.

---

## Overview of Steps

The project workflow is broken down into **four main stages**:

### 1. Splitting
- The input file `HIJING_LBF_test_small.out` is split into 10 subdirectories (`0/`, `1/`, ..., `9/`).
- Each subdirectory receives one file named `event_?.dat`, containing data for a specific event.

### 2. Filtering
- From each `event_?.dat` file, only **primary particles** (labeled `0` in the 3rd column) are retained.

### 3. Transferring
- The filtered data is converted into **ROOT TTrees**, where each event gets its own TTree.
- Data includes **PID** and **kinematic info** (px, py, pz, E).
- All TTrees are stored in a single ROOT file named `HIJING_LBF_test_small.root` in each subdirectory.
- Temporary `event_?.dat` files are deleted after this step.

### 4. Analysis
- All `HIJING_LBF_test_small.root` files are collected and passed to ROOT macros.
- The analysis produces:
  - A **figure** (in `.pdf`, `.eps`, `.png`, and `.C` formats) with **side-by-side histograms** for **transverse momentum (pT)** distributions of:
    - Pions
    - Kaons
    - Protons  
  - **Terminal output** showing the **average pT** for each particle type:
    ```
    Average pT for the whole dataset:
    o pions   = ??? GeV/c
    o kaons   = ??? GeV/c
    o protons = ??? GeV/c
    ```

Note: pT is calculated as:  
`pT = sqrt(px^2 + py^2)`

---

## How to Run

### Step-by-step

1. Make sure all required scripts and files are copied into the same directory.
2. Use the script below to **run everything at once**:
```bash
./TheFinalTouch.sh ${data_file} ${destination_directory}
