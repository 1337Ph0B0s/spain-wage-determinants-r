# Determinantes salariales en España — Regresión y clasificación salarial con R

**Análisis estadístico y modelado predictivo de salarios en España mediante regresión lineal múltiple y regresión logística.**

**Idioma:** [English](README.md) | Español | [Nederlands](README.nl.md)

## Descripción del proyecto

Este proyecto académico de ciencia de datos analiza cómo se relacionan distintas características personales y laborales con el **salario bruto anual** y con la probabilidad de pertenecer a la categoría de **salario alto**. Se utilizó una muestra basada en los datos salariales del **INE de España de 2022** y se trabajó en **R**.

La actividad incluye exploración estadística, visualizaciones, preparación de variables categóricas, partición de entrenamiento/prueba (80/20), modelos lineales, clasificación logística, diagnóstico de modelos y una reflexión ética sobre las diferencias salariales.

### Resultados principales del informe original

| Indicador | Resultado comunicado | Interpretación |
| --- | ---: | --- |
| Tamaño de la muestra | 10.000 observaciones | Datos originales de la actividad |
| Entrenamiento / prueba | 8.000 / 2.000 | División reproducible con `set.seed(42)` |
| R² ajustado (modelo lineal completo) | **0,3629** | Aproximadamente el 36,3 % de la variación salarial explicada en entrenamiento |
| AUC del modelo logístico (prueba) | **0,8512** | Capacidad de discriminación entre salario alto y no alto |
| Exactitud del modelo logístico (prueba) | **0,7705** | Aproximadamente el 77,1 % de las clasificaciones correctas |
| Sensibilidad / especificidad (prueba) | **0,7583 / 0,7825** | Rendimiento en ambas clases |

Los indicadores anteriores se han tomado del **informe académico adjunto**, pero no se han recalculado para esta publicación. La muestra CSV original proporcionada por el autor (10.000 registros y 56 columnas) **está incluida en el ZIP descargable**, en `data/raw/salarios_INE_2022_sample.csv`. El CSV está excluido por defecto de los commits de Git hasta comprobar los permisos de redistribución pública.

## Pregunta de investigación

¿Hasta qué punto se relacionan las características personales y ocupacionales con el salario y la probabilidad de percibir un salario alto? ¿Persisten las diferencias observadas por sexo y nacionalidad después de controlar otras variables disponibles?

## Metodología

1. **Carga y preparación:** Lectura de `salarios_INE_2022_sample.csv`, inspección y conversión de códigos categóricos en factores; agrupación de categorías de actividad económica y ocupación cuando corresponde.
2. **Análisis exploratorio:** Estadísticos descriptivos, comparación de salarios, correlaciones y gráficos.
3. **Partición reproducible:** 80 % para entrenamiento y 20 % para prueba, con semilla 42.
4. **Regresión lineal:** Modelos simples por sexo y nacionalidad, modelo con predictores cuantitativos y modelo multivariable completo para `RETRINOIN`.
5. **Diagnóstico:** Evaluación del ajuste, multicolinealidad (VIF), residuos y predicciones en el conjunto de prueba.
6. **Regresión logística:** Clasificación `SalarioAlto`, odds ratios, matriz de confusión, accuracy, recall, especificidad, curva ROC y AUC.
7. **Reflexión ética:** Interpretación prudente de las asociaciones estadísticas, limitaciones de las variables y posibles factores omitidos.

### Modelo representativo

```r
modelo_completo <- lm(
  RETRINOIN ~ ANOANTI + JAP +
    SEXO + TIPOPAIS + ESTU + TIPOJOR + TIPOCON +
    CNACE_grp + CNO1_grp + ESTRATO2 + CONTROL,
  data = train
)
```

En el informe, el coeficiente estimado para la categoría `Mujer` respecto a la referencia es de unos **−6.233,69 €** al controlar por las demás variables. Este resultado representa una **asociación estadística ajustada**, no una demostración de discriminación ni una relación causal.

## Tecnologías y competencias

**R · Análisis estadístico · Limpieza de datos · EDA · Regresión lineal múltiple · Regresión logística · Modelado predictivo · Visualización de datos · Evaluación de modelos · ROC/AUC**

Paquetes R utilizados: `readr`, `readxl`, `stringr`, `dplyr`, `ggplot2`, `knitr`, `kableExtra`, `tidyr`, `corrplot`, `car` y `pROC`.

## Estructura del repositorio

```text
wage_analysis.Rmd             # Código R Markdown y análisis original en español
README.md                     # Documentación principal en inglés
README.es.md                  # Documentación en español
README.nl.md                  # Documentación en neerlandés
scripts/install_dependencies.R
docs/academic_report_es.html  # Informe académico HTML ya generado
data/raw/salarios_INE_2022_sample.csv  # CSV incluido en el ZIP; excluido de Git
data/README.md               # Procedencia y disponibilidad de los datos
.gitignore
```

El [informe HTML original](docs/academic_report_es.html) permite consultar resultados, gráficos e interpretaciones **sin ejecutar R**. En la versión publicada del Rmd se han actualizado únicamente el título y la ruta absoluta del CSV para permitir su uso en otras máquinas; el contenido del análisis continúa en español.

## Cómo reproducirlo

**Requisitos:** R, R Markdown y los paquetes utilizados. El ZIP descargable ya incluye la muestra CSV original; una futura clonación pública de GitHub podría no incluirla hasta verificar la licencia.

1. Descargar y descomprimir el ZIP preparado (que ya incorpora el CSV) o clonar el repositorio cuando esté disponible.
2. Confirmar la presencia de `data/raw/salarios_INE_2022_sample.csv`. Si se clona desde GitHub y el archivo no está incluido, colocar una copia autorizada en esa ruta.
3. Instalar los paquetes y compilar el Rmd desde la raíz del proyecto:

```bash
git clone https://github.com/1337Ph0B0s/spain-wage-determinants-r.git
cd spain-wage-determinants-r
Rscript scripts/install_dependencies.R
Rscript -e 'rmarkdown::render("wage_analysis.Rmd")'
```

**Importante:** Los resultados corresponden a una muestra específica de 2022. Cambios en el dataset, codificación, niveles de factores o versiones de R pueden modificar las cifras. Algunas estadísticas y explicaciones del Rmd original están escritas directamente en el documento y no se recalculan de forma automática; conviene revisarlas al utilizar otra muestra.

## Datos, limitaciones y ética

- **Fuente:** Encuesta salarial del Instituto Nacional de Estadística (INE), España, 2022.
- **Archivo de entrada:** `salarios_INE_2022_sample.csv`, con 10.000 registros y 56 variables originales; incluido en el ZIP, pero excluido de Git hasta verificar los permisos de distribución.
- **Diccionario referenciado:** `dr_EES_2022.xlsx`, no incluido.
- **Reproducibilidad:** El ZIP incluye el código, la muestra original y el informe renderizado; los modelos no se han vuelto a ejecutar durante esta actualización.
- **Causalidad:** Los coeficientes observacionales no demuestran relaciones causales ni discriminación individual.
- **Privacidad:** No se deben redistribuir microdatos de empleados sin comprobar los permisos y garantías correspondientes.

Este repositorio tiene fines académicos y de portafolio profesional; sus resultados no deben utilizarse para tomar decisiones automatizadas sobre empleo.

## Autor y contexto

**Pablo Pazmiño Naranjo** · Actividad 3 del máster en Ciencia de Datos · 20 de diciembre de 2025.

Por el momento no se ha asignado una licencia de software libre a este nuevo repositorio; el autor conserva sus derechos conforme a la normativa aplicable.