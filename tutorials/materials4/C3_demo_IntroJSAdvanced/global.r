rm(list = ls())

library(shiny)
library(htmlwidgets)
library(C3)
library(jsonlite)

FrissHeader <- list(
  tags$a(href = "http://friss.eu/en",
         tags$img(src="friss.svg", id = "FrissLogo")
  ),
  singleton(includeCSS("www/friss.css")),
  singleton(includeScript("www/style.js")),
  singleton(includeScript("www/annyang.min.js")),
  singleton(includeScript("www/speechRecognition.js")),
  singleton(includeScript("www/intro.min.js")),
  singleton(includeCSS("www/introjs.min.css")),
  singleton(includeCSS("www/app.css")),
  singleton(includeScript("www/app.js")),
  actionButton(inputId="startHelp", "help", style = "background-color:green;color:white;padding:1px;position:fixed;right:20px;top:20px;z-index:100000000000")
)

# Load help contents
helpData <- read.csv("help.csv")

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


