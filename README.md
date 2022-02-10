# MSK-IMPACT - Mucosal melanoma

Code and notebooks for MSK-IMPACT analysis of mucosal melanoma.

# Installation

Download RStudio and install the R packages used to manipulate the data and prepare the figures.

```{r}
install.packages("tidyverse")
install.packages("cowplot")
install.packages("grid")
install.packages("ComplexHeatmap")
install.packages("RColorBrewer")
```

# Notebook

To visualise the cohort diagram, you can render the RMarkdown notebook using the command below.

```{r}
rmarkdown::render("cohort_overview.Rmd")
```

There are some utility functions available under `src/` and the color scheme used for the plots is defined in the `resources/annotation/colors.yaml` YAML file.