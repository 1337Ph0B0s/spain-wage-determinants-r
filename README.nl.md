# Loonverschillen in Spanje — Regressieanalyse en loonclassificatie met R

**Statistische analyse en voorspellende modellering van Spaanse loongegevens met meervoudige lineaire regressie en logistische regressie.**

**Taal:** [English](README.md) | [Español](README.es.md) | Nederlands

## Projectoverzicht

Dit academische data-scienceproject onderzoekt hoe persoonlijke kenmerken en arbeidsomstandigheden samenhangen met het **jaarlijkse brutoloon** en met de kans om tot de categorie **hoger loon** te behoren. Het onderzoek gebruikt een steekproef op basis van de **Spaanse loonstatistieken van het INE uit 2022** en werd uitgevoerd in **R**.

Het project omvat beschrijvende statistiek, verkennende visualisaties, voorbereiding van categorische variabelen, een train-testverdeling (80/20), lineaire regressiemodellen, logistische classificatie, modeldiagnostiek en een ethische reflectie over loonverschillen.

### Belangrijkste resultaten uit het oorspronkelijke verslag

| Indicator | Gerapporteerde waarde | Betekenis |
| --- | ---: | --- |
| Omvang van de steekproef | 10.000 waarnemingen | Oorspronkelijke dataset van de opdracht |
| Training / test | 8.000 / 2.000 | Reproduceerbare willekeurige verdeling met `set.seed(42)` |
| Gecorrigeerde R² (volledig lineair model) | **0,3629** | Ongeveer 36,3% van de loonvariatie verklaard in de trainingsgegevens |
| AUC van het logistische model (test) | **0,8512** | Onderscheidend vermogen voor de twee looncategorieën |
| Accuratesse van het logistische model (test) | **0,7705** | Ongeveer 77,1% correcte voorspellingen |
| Sensitiviteit / specificiteit (test) | **0,7583 / 0,7825** | Prestaties voor beide doelklassen |

Deze waarden komen uit het **bijgevoegde academische verslag** en zijn niet opnieuw berekend voor deze publicatie. De oorspronkelijke CSV-steekproef, aangeleverd door de auteur (10.000 records en 56 kolommen), is **opgenomen in het downloadbare ZIP-bestand** op `data/raw/salarios_INE_2022_sample.csv`. Het databestand is standaard uitgesloten van Git-commits zolang de toestemming voor openbare herverdeling niet is gecontroleerd.

## Onderzoeksvraag

In welke mate hangen persoonlijke en beroepsgerelateerde kenmerken samen met het loon en de kans op een hoger loon? Blijven de waargenomen loonverschillen naar geslacht en nationaliteit bestaan nadat rekening is gehouden met andere beschikbare factoren?

## Methodologie

1. **Inlezen en voorbereiden:** Import van `salarios_INE_2022_sample.csv`, verkenning van de gegevens en omzetting van gecodeerde categorieën naar factoren; waar nodig groepering van bedrijfstakken en beroepscategorieën.
2. **Verkennende analyse:** Beschrijvende statistiek, loonvergelijkingen, correlaties en grafieken.
3. **Reproduceerbare verdeling:** 80% trainingsgegevens en 20% testgegevens, met random seed 42.
4. **Lineaire regressie:** Eenvoudige modellen voor geslacht en nationaliteit, een model met kwantitatieve voorspellers en een volledig multivariabel model voor `RETRINOIN`.
5. **Modeldiagnostiek:** Beoordeling van modelpassing, multicollineariteit (VIF), residuen en voorspellingen op de testset.
6. **Logistische regressie:** Classificatie `SalarioAlto`, oddsratio's, verwarringsmatrix, accuratesse, sensitiviteit, specificiteit, ROC-curve en AUC.
7. **Ethische reflectie:** Voorzichtige interpretatie van statistische verbanden, beperkingen van de gebruikte variabelen en mogelijke ontbrekende factoren.

### Voorbeeld van het meervoudige regressiemodel

```r
modelo_completo <- lm(
  RETRINOIN ~ ANOANTI + JAP +
    SEXO + TIPOPAIS + ESTU + TIPOJOR + TIPOCON +
    CNACE_grp + CNO1_grp + ESTRATO2 + CONTROL,
  data = train
)
```

In het verslag wordt voor de categorie `Mujer` ten opzichte van de referentiecategorie een regressiecoëfficiënt van ongeveer **−€6.233,69** gerapporteerd, gecontroleerd voor de overige opgenomen voorspellers. Dit is een **gecorrigeerd statistisch verband**, geen bewijs van discriminatie of een causaal effect.

## Technologieën en vaardigheden

**R · Statistische analyse · Data Cleaning · Exploratory Data Analysis (EDA) · Meervoudige lineaire regressie · Logistische regressie · Predictive Modeling · Datavisualisatie · Modelevaluatie · ROC/AUC**

Gebruikte R-packages: `readr`, `readxl`, `stringr`, `dplyr`, `ggplot2`, `knitr`, `kableExtra`, `tidyr`, `corrplot`, `car` en `pROC`.

## Structuur van de repository

```text
wage_analysis.Rmd             # R Markdown-broncode en oorspronkelijk Spaanstalig verslag
README.md                     # Hoofddocumentatie in het Engels
README.es.md                  # Documentatie in het Spaans
README.nl.md                  # Documentatie in het Nederlands
scripts/install_dependencies.R
docs/academic_report_es.html  # Oorspronkelijk gegenereerd HTML-verslag
data/raw/salarios_INE_2022_sample.csv  # CSV in de ZIP; uitgesloten van Git
data/README.md               # Herkomst en beschikbaarheid van de gegevens
.gitignore
```

Het [oorspronkelijke HTML-verslag](docs/academic_report_es.html) bevat de resultaten, grafieken en interpretaties en kan worden bekeken **zonder R uit te voeren**. Voor de GitHub-versie van het Rmd werden enkel de titel en het absolute Windows-pad naar het CSV-bestand aangepast; de beschrijvende tekst van de analyse bleef in het Spaans.

## Analyse reproduceren

**Vereisten:** R, R Markdown en de gebruikte packages. Het downloadbare ZIP-bestand bevat de oorspronkelijke CSV-steekproef; in een toekomstige openbare GitHub-clone ontbreekt dit bestand mogelijk zolang de verspreidingsrechten niet vaststaan.

1. Download en pak het voorbereide ZIP-bestand uit (de CSV is daarin aanwezig), of clone de repository zodra die beschikbaar is.
2. Controleer of `data/raw/salarios_INE_2022_sample.csv` bestaat. Voeg bij een Git-clone zonder dataset zelf een toegestane kopie op deze locatie toe.
3. Installeer de packages en render het Rmd-bestand vanuit de hoofdmap:

```bash
git clone https://github.com/1337Ph0B0s/spain-wage-determinants-r.git
cd spain-wage-determinants-r
Rscript scripts/install_dependencies.R
Rscript -e 'rmarkdown::render("wage_analysis.Rmd")'
```

**Belangrijk:** De gerapporteerde cijfers horen bij één specifieke steekproef uit 2022. Een andere dataset, codering, indeling van factorcategorieën of softwareversie kan tot andere resultaten leiden. Sommige getallen en interpretaties staan als vaste tekst in het oorspronkelijke Rmd en worden niet automatisch herberekend; controleer die bij hergebruik van andere gegevens.

## Gegevensbeschikbaarheid en ethische aandachtspunten

- **Bron:** Instituto Nacional de Estadística (INE), Spaanse loonstatistieken 2022.
- **Invoerbestand:** `salarios_INE_2022_sample.csv`, met 10.000 rijen en 56 oorspronkelijke kolommen; opgenomen in de ZIP maar uitgesloten van Git totdat herverdeling is toegestaan.
- **Vermeld gegevenswoordenboek:** `dr_EES_2022.xlsx`, niet meegeleverd.
- **Reproduceerbaarheid:** De ZIP bevat de broncode, de oorspronkelijke steekproef en het gerenderde verslag; de modellen zijn tijdens deze update niet opnieuw uitgevoerd.
- **Interpretatie:** Observationele statistische verbanden bewijzen geen causaliteit of individuele discriminatie.
- **Privacy:** Publiceer of verspreid geen microgegevens van werknemers zonder te controleren of dit rechtmatig is en voldoende privacywaarborgen biedt.

Deze repository is bedoeld als academisch project en professioneel portfolio, niet voor geautomatiseerde besluitvorming over personeel.

## Auteur en context

**Pablo Pazmiño Naranjo** · Masteropleiding Data Science · Opdracht 3 (20 december 2025).

Voor deze nieuwe repository is voorlopig geen opensourcelicentie gekozen; de auteur behoudt de toepasselijke rechten totdat een licentie wordt geselecteerd.