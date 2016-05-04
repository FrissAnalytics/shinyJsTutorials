rm(list = ls())

library(shiny)
library(C3Gauge)

FrissHeader <- list(
  tags$a(href = "https://shiny.frissplatform.eu/friss/#apps",
         tags$img(src="friss.svg", id = "FrissLogo")
  ),
  singleton(includeCSS("www/friss.css")),
  singleton(includeScript("www/style.js")),
  singleton(includeCSS("www/app.css"))
)