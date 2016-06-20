rm(list = ls())

library(shiny)
library(htmlwidgets)
library(C3)

FrissHeader <- list(
  tags$a(href = "http://friss.eu/en",
         tags$img(src="friss.svg", id = "FrissLogo")
  ),
  singleton(includeCSS("www/friss.css")),
  singleton(includeScript("www/style.js")),
  singleton(includeCSS("www/app.css"))
)

###
### get some fake data: random walk with drift
###

# see http://stackoverflow.com/questions/24272862/generate-random-walk-with-drift-and-or-trend-in-r

getSeries <- function( n = 100, drift = 0.1, walk = 4, scale = 100){
  y <- scale * cumsum(rnorm(n= n, mean = drift, sd=sqrt(walk)))
  return(y + abs(min(y)))
}

# make sure we get the same data each time
set.seed(100)

# helpers to center text
h3c <- function(text){
  h3(text, style = "text-align:center")
}

h4c <- function(text){
  h4(text, style = "text-align:center")
}


