rm(list = ls())

library(shiny)
library(C3Gauge2)
library(C3PieChart)
library(C3StackedAreaChart)

FrissHeader <- list(
  tags$a(href = "https://shiny.frissplatform.eu/friss/#apps",
         tags$img(src="friss.svg", id = "FrissLogo")
  ),
  singleton(includeCSS("www/friss.css")),
  singleton(includeScript("www/style.js")),
  singleton(includeCSS("www/app.css"))
)