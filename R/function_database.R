
#' calculate volume of a shrub
#@param: length of shrub (numeric, default 1)
#@param: width of shrub (numeric, default 1)
#@param: height of shrub (numeric, default 1)
#@return: volume of shrub (numeric, default 1)
#@examples


calc_shrub_vol <- function(length, width, height){
  volume <- length*width*height
  return(volume)
}

#' calculate density of a shrub
shrub_density <- function(width = 2, length = 4, height = 1){
  den <- calc_shrub_vol(width, length, height)/est_shrub_mass(calc_shrub_vol(width, length, height))
  return(den) 
}
#' calculate density of a shrub
#'@param: length of shrub (numeric, default 4)
#'@param: width of shrub (numeric, default 2)
#'@param: height of shrub (numeric, default 1)
#'@return: density of shrub (numeric, default 1)



est_shrub_mass <- function(volume){
    mass <- 2.65 * volume^0.9
}

#' calculate mass of shrub
#'@param: length of shrub (numeric)
#'@return: mass of shrub

est_shrub_mass_dim <- function(length, width, height){
  volume = calc_shrub_vol(length, width, height)
  mass <- est_shrub_mass(volume)
  return(mass)
}

#' Search for the years 2018 and 2020

search_year <- function(taxon){
       query <- paste(ant, " AND 2018:2020[PDAT]")
       search_returns <- c(entrez_search(db = "Nucleotide", term = query, retmax = 10, api_key = "072e868e321baa438584622871529bc5c408"))
       return(search_returns)
  }