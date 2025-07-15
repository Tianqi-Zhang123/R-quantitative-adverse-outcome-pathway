# quantitative-adverse-outcome-pathway
Development of a gene expression-based response-response qAOP Model to Unravel Mechanisms of Gentamicin-induced Nephrotoxicity
the project is unfinished, these codes are only part of the project
# Files and Their Functions (use combine with the Methods & Materials Section of the Thesis)

- **`raw_data.Rmd`**  
  Used for preprocessing the transcriptomic data.  

- **`Functions.R`**  
  Contains functions required by `raw_data.Rmd` and needs to be sourced within it.  

- **`module_analysis.Rmd`**  
  Checks the consistency of dose-response trends across biological replicates.  

- **`dose-response analysis.Rmd`**  
  Builds dose-response models.  

- **`observing R-R trends.Rmd`**  
  Detects potential outliers in multi-to-one response-response relationships (multi-to-one means having multiple input key events).  

- **R-R Files:**  
  - `164_97_71.Rmd`  
  - `277_239_50.Rmd`  
  - `277_50_97.Rmd`  
  - `50_95_155_159.Rmd`  
  
  These files are used to model multi-to-one response-response relationships. The numbers correspond to module numbers in the study. The last number in each filename represents the downstream key event, while the preceding numbers represent the input key events.  

- **`1_1 response_response.Rmd`**  
  Used to build one-to-one response-response models (i.e. with only one input key event). The initial part of this file is dedicated to detecting potential outliers.
## Note on `plot.R` and `modified_weibull.Rmd`

These two files are not referenced in my final thesis because the methods implemented there are not part of the analyses required for the final results. Omitting them does not affect the reproducibility of the main results; they were simply uploaded earlier and I didn’t bother to delete them afterwards.

- **`plot.R`**  
  This script was used to visualize the eigengene scores in the visualize module.

- **`modified_weibull.Rmd`**  
  This R Markdown file was initially created for building a one-to-one response-response model using the R package **drm**. However, the package’s built-in functions could not handle input data where the x-axis values were less than or equal to zero. Therefore, I modified one of its internal functions to allow fitting models with x values equal to zero.
