#mahoney.package
##author: Victoria Mahoney
### This package will enable you to simply run a linear regression, plot the output of that, and also run an anova on your data. 

Package: mahoney.package
Title: One way ANOVA, linear regression, and linear regression plotting
Version: 0.0.0.9000
Authors@R: 
    person(given = "Victoria",
           family = "Mahoney",
           role = c("aut", "cre"),
           email = "victoria.mahoney@selu.edu",
           comment = c(ORCID = "YOUR-ORCID-ID"))
Description: This package will aid you in a one way ANOVA, linear regression, and then plot your linear regression. 
Depends: (R> 4.0.0)
Imports: iNEXT, tidyverse, ggplot2, assertthat, dplyr
Suggests: knitr, rmarkdown, testthat
License: MIT
Encoding: UTF-8
LazyData: true
Roxygen: list(markdown = TRUE)
RoxygenNote: 7.1.1


---
title: "Tutorial"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

Below is a chunk that will install the package for you. Run this to install the package. 

```{r}
devtools::install_github("victoria-mahoney/mahoney.package") 
```

Next you will load the package in. This will ensure you can work with it. 

``` {r}
library("mahoney.package")
```

Now let's read in the data that we will be testing our function with. This is a dataset that records the survival of _Hyalella sp._ over a variety of salinity treatments. 

``` {r}

library(readr)
hyalella <- read_csv("../inst/extdata/Hyalella_data.csv")
summary(hyalella)

```
