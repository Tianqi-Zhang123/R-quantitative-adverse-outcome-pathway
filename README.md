# Project Overview

This repository provides code and resources for developing a quantitative Adverse Outcome Pathway (qAOP). The pipeline integrates data preprocessing, model fitting, visualization, and evaluation using various R scripts and software tools.

---

## Figure Descriptions

### **Figure 1 – Methods of Modelling Response-Response Relationships**

**Panel A**  
Visualizes relationships between KE1 (Lipid Peroxidation) and KE3 (Apoptosis), and between KE2 (ER Stress) and KE3 using `ggpairs()`. This helps guide model selection and estimate starting values.

**Panel B**  
Workflow of the iterative fitting process, created using PowerPoint and Inkscape.

**Panel C**  
Initial model before iterative adjustment (start values all set to 1).

**Panel D**  
Final model after iterative fitting.

---

### **Figure 2 – Transcriptomic Data Preprocessing and DE Analysis**

**Panel A**  
Generated using `raw_data.Rmd` and dependent on functions from `Functions.R`.

- Raw count data: `EUT125_RNA-Seq_Counts_per_gene_per_sample_raw_merge.txt`  
- Metadata: `EUT125_DAM_Metadata.txt`  
- Retained only gentamicin-treated and control groups.  
- Removed samples with low library size.  
- Genes were filtered (CPM > 1 in 75% of samples in the same group), aggregated to gene level, and analyzed using DESeq2 to calculate **log2 fold changes**.  
- Results were uploaded to **TXG-MAPr**, from which module eigengene (EG) values were downloaded (`moduleTable.txt`).

**Panel B**  
Dendrogram of module eigengene scores after 24-hour high-dose gentamicin exposure (from TXG-MAPr).

**Panel C**  
Gene network visualization of **Module 50**, refined in Inkscape.

**Panels D, F, J**  
Evaluates consistency of dose-response trends using `module_analysis.Rmd`, based on data in `moduleTable.txt`. These panels are representative cases of inconsistency observed during the analysis.

---

### **Figure 3 – Network Visualization**

Drawn using Cytoscape after obtaining node and edge data.

---

### **Figure 4 – Dose-Response Modelling**

Constructed using `dose-response analysis.Rmd` and the R package `drm`.  
Each KE was fit to **seven candidate models**:

- `MM.2()`, `MM.3()`, `MM.4()`  
- `LL.2()`, `LL.3()`, `LL.4()`  
- `W1.4()`

Model selection was based on:

1. **Biological plausibility**  
2. **Bayesian Information Criterion (BIC)**  
3. **R² (Goodness-of-fit)**

> In many cases, all three criteria could not be satisfied simultaneously.

**Panel G**  
Model with lowest BIC and highest R².

**Panels A, B, C, F, H, K, L**  
Selected models with lowest BIC and relatively high R².

**Panels D, E, J**  
Some models performed better by BIC or R² but led to biologically implausible trends (e.g., flat upstream curves and steep downstream trends). These were excluded in favor of Michaelis-Menten models.

**Panel I**  
`MM.2` had lowest BIC but assumed a minimum response of zero, which conflicted with observed negative EGs at low doses.  
Thus, `MM.3` was selected for better visual fit despite slightly worse metrics.

---
### Outlier Detection Before Response-Response Modeling

Prior to all multi-to-one response-response modeling steps presented in **Figures 5–7**, potential outliers were identified using `observing R-R trends.Rmd`.  
This preprocessing step ensured that only reliable modules were used for downstream response-response modeling and visualization.

---

### **Figure 5 – Response-Response Modelling (three-to-one)**

**Panel A**  
Illustration created in Inkscape.

**Panels B, C, D**  
Plots generated using `50_95_155_159.Rmd`, model fitted using `nls` and visualized accordingly (data from `moduleTable.txt`).

---

### **Figure 6 – Response-Response Modelling (two-to-one)**

**Panel A**  
The small network was illustrated in Inkscape, modeling and visualization using `164_97_71.Rmd`.

**Panel B**  
Another small network was illustrated in Inkscape, modeling and visualization using `277_50_97.Rmd`.

---

### **Figure 7 – Response-Response Modelling (two-to-one and one-to-one）**

**Panel A**  
The small network was illustrated in Inkscape, modeling and visualization using `277_239_50.Rmd`.

**Panel B**  
One-to-one R-R relationships were modeled and visualized using `1_1 response_response.Rmd`.  
The first half of the script performs outlier detection, while the second half conducts model fitting and visualization.

---

### **Figure 8 – MIE-to-KE Relationships**

All MIE → final KE relationships were visualized using `MIE-AO.Rmd`. Three are shown as examples.

---
### **Extra File**

**Plot.R**
Script used to plot the dose-EGs profile (aggregated, not per replicate). This file was not used in the final thesis.

**modified_weibull1.Rmd**
Script used for model fitting during the response-response modelling stage. It was adjusted (shifted to the right) to allow for negative x values, but was not included in the final response-response modelling.
