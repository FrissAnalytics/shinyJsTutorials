# required libs
library(shiny)
library(C3)
library(shinyBS)

# FRISS header
FrissHeader <- list(
  singleton(includeScript("www/d3.js")),
  tags$a(href = "http://www.friss.eu/en",
         tags$img(src="friss.svg", id = "FrissLogo")
  ),
  singleton(includeCSS("www/friss.css")),
  singleton(includeScript("www/style.js")),
  singleton(includeCSS("www/app.css"))
)

# helper function to create some fake data: random walk with drift
# see http://stackoverflow.com/questions/24272862/generate-random-walk-with-drift-and-or-trend-in-r

getSeries <- function( n = 100, drift = 0.1, walk = 4, scale = 100){
  y <- scale * cumsum(rnorm(n= n, mean = drift, sd=sqrt(walk)))
  y <- round(y)
  return(y + abs(min(y)))
}
