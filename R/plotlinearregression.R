#' The purpose of this function is to plot a graph based on a previously run linear regression using the package. 
#' fexport
#' @param x.var is the independent variable
#' @param y.var is the dependent variable
#' @param dataframe is the dataset you are analyzing
#' @return a linear model of Hyalella sp. survival

linplot <- function(x.var, y.var, dataframe){
 x.var <- enquo(x.var)
 y.var <- enquo(y.var)
 ggp <- ggplot(data = dataframe, mapping = aes(x = !! x.var, y = !! y.var)) + geom_point(size = 1) + geom_smooth(method = "lm", color = "navy", size = 0.5, fill = "deeppink4") + labs(x= "Treatment", y = "Days Until Death", title = "Linear model of Hyalella sp. survival") + theme_classic()
assert_that(not_empty(ggp))    
  return(ggp)
}