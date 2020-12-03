#' The purpose of this function will be to run an anova.
#' fexport
#' #'@param predictor is the independent variable
#'@param response is the dependent variable
#'@param dataframe is the dataset 
#'@return a summary of an analysis of variance

anva <- function(predictor, response, dataframe){
  anva_output <- aov(predictor ~ response, data = dataframe)
  anva_results <- summary(anva_output)
  assert_that(not_empty(anva_results))
  return(anva_results)
}

