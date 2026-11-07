# Wage Determinants in Spain — Regression & Salary Classification in R

**Statistical analysis and predictive modeling of Spanish wage data using multiple linear regression and logistic regression.**

**Language:** English | [Español](README.es.md) | [Nederlands](README.nl.md)

## Project overview

This academic data science project examines how personal and employment characteristics are associated with **annual gross earnings** and the probability of belonging to a **high-salary category**. It uses a sample based on the Spanish National Statistics Institute (INE) **2022 wage survey** and was developed in **R**.

The work covers descriptive statistics, exploratory visualizations, preparation of categorical variables, an 80/20 train–test split, linear models, logistic classification, diagnostics, and an ethical discussion of the interpretation of wage differences.

### Key results from the submitted report

| Indicator | Reported result | Meaning |
| --- | ---: | --- |
| Sample size | 10,000 observations | Original sample used for the activity |
| Train / test | 8,000 / 2,000 | Reproducible random split with `set.seed(42)` |
| Adjusted R² (full linear model) | **0.3629** | Approximately 36.3% of wage variation explained in the training data |
| Logistic classification AUC (test) | **0.8512** | Discrimination between high- and non-high-salary classes |
| Logistic classification accuracy (test) | **0.7705** | Approximately 77.1% correct classifications |
| Sensitivity / specificity (test) | **0.7583 / 0.7825** | Performance for the two target classes |

These are **results reported in the supplied academic report**, not results independently reproduced in this repository. The original 10,000-row, 56-column CSV supplied by the author is included in the **downloadable project ZIP** at `data/raw/salarios_INE_2022_sample.csv`. These reported metrics have not been independently recalculated. The raw file is excluded from Git commits by default while public redistribution rights are checked.

## Research question

To what extent are personal and occupational characteristics associated with earnings and the likelihood of receiving a high salary? Do observed wage differences by sex and nationality remain after controlling for other available factors?

## Methodology

1. **Load and prepare the data.** Import `salarios_INE_2022_sample.csv`, inspect data quality, convert coded categorical predictors to factors, and group economic-activity and occupational categories where needed.
2. **Explore distributions and relationships.** Produce descriptive summaries, salary comparisons, correlations, and visualizations.
3. **Create a reproducible split.** Allocate 80% of observations to training and 20% to testing with seed 42.
4. **Estimate linear models.** Compare simple models for sex and nationality, a quantitative-predictor model, and a full multiple-regression model of annual earnings (`RETRINOIN`).
5. **Check diagnostics and prediction errors.** Evaluate model fit, multicollinearity (VIF), residual diagnostics, and predictions on the holdout sample.
6. **Build a logistic classifier.** Model the probability of the report's high-salary category (`SalarioAlto`), examine odds ratios, a confusion matrix, accuracy, recall, specificity, the ROC curve, and AUC.
7. **Interpret limitations.** Distinguish observational associations from causal effects and discuss limitations in the demographic variables and possible omitted factors.

### Representative model

```r
modelo_completo <- lm(
  RETRINOIN ~ ANOANTI + JAP +
    SEXO + TIPOPAIS + ESTU + TIPOJOR + TIPOCON +
    CNACE_grp + CNO1_grp + ESTRATO2 + CONTROL,
  data = train
)
```

The fitted sex coefficient in the full linear model is reported as approximately **−€6,233.69** for the category `Mujer` relative to its reference group, conditional on the other included predictors. This is a **statistical association**, not proof of discrimination or a causal estimate. Other coefficients must be interpreted in the same conditional and observational context.

## Technologies and skills

**R · Statistical Analysis · Data Cleaning · Exploratory Data Analysis (EDA) · Multiple Linear Regression · Logistic Regression · Predictive Modeling · Data Visualization · Model Evaluation · ROC/AUC**

Key R packages used in the submitted source: `readr`, `readxl`, `stringr`, `dplyr`, `ggplot2`, `knitr`, `kableExtra`, `tidyr`, `corrplot`, `car`, and `pROC`.

## Repository contents

```text
wage_analysis.Rmd             # Adapted, portable R Markdown source (Spanish narrative)
README.md                     # Main documentation in English
README.es.md                  # Spanish documentation
README.nl.md                  # Dutch documentation
scripts/install_dependencies.R
docs/academic_report_es.html  # Original rendered academic submission
data/raw/salarios_INE_2022_sample.csv  # Original data included in local ZIP; ignored by Git
data/README.md               # Dataset provenance and usage instructions
.gitignore
```

The original academic HTML report is preserved as [`docs/academic_report_es.html`](docs/academic_report_es.html) for reviewing code output, charts, and interpretations **without executing R**. The R Markdown's original text remains in Spanish; the title and absolute Windows CSV path were adapted for a portable repository.

## Reproducing the analysis

**Prerequisites:** R, R Markdown, and the packages used in the report. The downloadable ZIP includes the exact CSV sample, but a future public GitHub clone may not, pending a licensing check.

1. Download and extract the prepared project ZIP (which already includes the CSV), or clone the GitHub repository when available.
2. Confirm that `data/raw/salarios_INE_2022_sample.csv` exists. If using a Git clone without the dataset, add your own authorized copy at this path.
3. Install the required R packages and render the notebook from the project root:

```bash
git clone https://github.com/1337Ph0B0s/spain-wage-determinants-r.git
cd spain-wage-determinants-r
Rscript scripts/install_dependencies.R
Rscript -e 'rmarkdown::render("wage_analysis.Rmd")'
```

**Important:** The report reflects an academic analysis performed on a specific 2022 INE sample. Changing the dataset, variable coding, factor levels, or software versions may change the numerical results. Some numerical values and narrative interpretations in the submitted Rmd are entered directly rather than computed dynamically; verify them when adapting the project to another dataset.

## Data availability and ethical considerations

- **Source context:** Spanish National Statistics Institute (INE), 2022 wage survey.
- **Input file:** `salarios_INE_2022_sample.csv` — 10,000 rows and 56 original columns; included in the local ZIP at `data/raw/` but ignored by Git until redistribution rights are confirmed.
- **Supporting documentation:** The original exercise references the INE variable dictionary `dr_EES_2022.xlsx` (not provided).
- **Reproducibility:** The code, original sample in the ZIP, and rendered report are available for local analysis; the results have not been independently re-run during packaging.
- **Interpretation:** This is observational modeling; group-level differences cannot establish individual discrimination or causality.
- **Privacy:** Do not publish or redistribute employee-level microdata without verifying permissions and privacy protections.

This repository is an educational portfolio project and its findings should not be used as an automated employment decision system.

## Author and context

**Pablo Pazmiño Naranjo** · Master's-level Data Science coursework · Activity 3 (20 December 2025).

No open-source license is currently assigned to this new repository; the author retains the applicable rights until a license is selected.