# Install the packages used by wage_analysis.Rmd
packages <- c(
  "readr", "readxl", "stringr", "dplyr", "ggplot2",
  "knitr", "kableExtra", "tidyr", "corrplot", "car", "pROC",
  "rmarkdown"
)
missing <- setdiff(packages, rownames(installed.packages()))
if (length(missing) > 0L) {
  install.packages(missing, repos = "https://cloud.r-project.org")
}
message("All required R packages are installed.")
