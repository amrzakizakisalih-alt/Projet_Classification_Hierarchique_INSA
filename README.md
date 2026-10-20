# Hierarchical Ascendant Classification & Multivariate Data Analysis (Projet MSRO S6)

A statistical learning and exploratory data analysis project in **R** focused on Principal Component Analysis (PCA) and Ward's Hierarchical Ascendant Classification (HAC / CAH) applied to biomedical and anthropometric data.

This project was developed as part of the GM3 (Mathematical Engineering) curriculum at **INSA Rouen Normandie** (Academic Year 2024-2025), supervised by **Mr. T. B. Gnamah**, and created by **Mouad Sheradj Drissi** and **Amr Zaki Salih**.

---

## Overview

The objective of this project is to explore and segment multidimensional observations through unsupervised statistical learning methods. 

Using an anthropometric dataset (`Obesity Classification.csv`), the study applies:
1. **Descriptive Statistics & Bivariate Analysis:** Univariate distributions, boxplots, variance analysis, and Pearson correlation matrices between Age, Height, Weight, and BMI.
2. **Principal Component Analysis (PCA / ACP):** Comparing unstandardized vs standardized PCA to reduce dimensionality while preserving maximal inertia.
3. **Ward's Hierarchical Ascendant Classification (CAH):** Constructing hierarchical dendrograms using Ward's minimum variance criterion ($D2$), evaluating optimal cluster cuts ($k=3$ and $k=5$).
4. **Consolidated Clustering (HCPC):** Refining hierarchical clusters through K-means consolidation (`consol=TRUE`).
5. **Comparative Robustness Assessment:** Contrasting clustering outcomes obtained from raw vs standardized variables to assess metric distortion.

---

## Repository Structure

```
Projet_S6_MSRO/
├── projetAD.R                     # Main statistical pipeline (Descriptive stats, PCA, HCPC, plots)
├── projet msro 3.R                # Auxiliary clustering and dendrogram routines
├── Obesity Classification.csv     # Anthropometric dataset
├── projet_msro_ad.pdf             # Comprehensive academic project report
├── acpnormee.png                  # Standardized PCA factor map
├── acpnonnormee.png               # Unstandardized PCA factor map
├── images msro/                   # Descriptive boxplots, summaries, and regression figures
├── MSRO-projet1.pdf               # Project assignment sheet Part 1
├── MSRO-projet2.pdf               # Project assignment sheet Part 2
├── MSRO-projet3.pdf               # Project assignment sheet Part 3
├── .gitignore                     # R environment ignore rules
└── README.md
```

---

## Prerequisites & Installation

The project runs on **R (version 4.0 or higher)** and leverages packages dedicated to exploratory data analysis:

```r
install.packages(c("FactoMineR", "factoextra", "ggplot2"))
```

---

## Running the Analyses

1. Clone or download the repository.
2. Open an R session in the repository directory (or launch RStudio).
3. Execute the main analysis script:
   ```bash
   Rscript projetAD.R
   ```
4. All statistical summaries, correlation tables, factor maps, and clustering dendrograms will be displayed and generated.

---

## Report & Findings

The full academic report is available in:
- **`projet_msro_ad.pdf`**: Detailed theoretical background, mathematical formulas (inertia decomposition, Ward's distance), PCA projection axes, dendrogram interpretation, and medical cluster profiling.

---

## Authors & Acknowledgments

- **Mouad Sheradj Drissi**
- **Amr Zaki Salih**

**Academic Advisor:** **Mr. T. B. Gnamah** — INSA Rouen Normandie

---

## Institution

**INSA Rouen Normandie**  
Department of Mathematical Engineering (GM3)
