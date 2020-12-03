#mahoney.package
##author: Victoria Mahoney
### This package will enable you to simply run a linear regression, plot the output of that, and also run an anova on a data that measured the survival of _Hyalella sp._ over salinity treatments ranging from 0 ppt - 9 ppt. 


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
### The first function will help you run a linear regression. 

Linear regressions are a useful statistical tool. Let's run this on our test data to see how well it fits a linear regression. The first line shows you the basic input that you will fill in, and then after shows how well the data fits a linear model. 


``` {r}
library(assertthat)
linreg <- function(predictor, response, dataframe){
  lm_output <- lm(predictor ~ response, data = dataframe)
  regression_output <- summary(lm_output)
  assert_that(not_empty(regression_output))
  return(regression_output)
}
linreg(hyalella$Treatment, hyalella$Days_Until_Death, hyalella)

```

###The second function will help you plot your linear model. 


These data look quite the opposite of linear, but let's test that by plotting the regression. 
``` {r}
library(ggplot2)
linplot <- function(x.var, y.var, dataframe){
 x.var <- enquo(x.var)
 y.var <- enquo(y.var)
 ggp <- ggplot(data = dataframe, mapping = aes(x = !! x.var, y = !! y.var)) + geom_point(size = 1) + geom_smooth(method = "lm", color = "navy", size = 0.5, fill = "deeppink4") + labs(x= "Treatment", y = "Days Until Death", title = "Linear model of Hyalella sp. survival") + theme_classic()
assert_that(not_empty(ggp))    
  return(ggp)
}
> linplot(hyalella$Treatment, hyalella$Days_Until_Death, hyalella)

```

This plot highlights the lack of linearity. 

###The third function will run an anova on these data. 

Now let's test for significance between the treatment and Days until Death using an anova. Again the first line is 

``` {r}
anva <- function(predictor, response, dataframe){
  anva_output <- aov(predictor ~ response, data = dataframe)
  anva_results <- summary(anva_output)
  assert_that(not_empty(anva_results))
  return(anva_results)
}
anva <- function(predictor, response, dataframe)
anva(hyalella$Treatment, hyalella$Days_Until_Death, hyalella)
```
