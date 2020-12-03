#' The purpose of this script will be to perform a linear regression on the survival of Hyalella sp. over different salinity treatments. 
#' 
#'@param predictor is the independent variable
#'@param response is the dependent variable
#'@param dataframe is the dataset
#'@return summary of the linear model 
#'@export

linreg <- function(predictor, response, dataframe){
  lm_output <- lm(predictor ~ response, data = dataframe)
  regression_output <- summary(lm_output)
  assert_that(not_empty(regression_output))
  return(regression_output)
}