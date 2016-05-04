shinyUI(
  
  navbarPage(id="main", windowTitle = "Friss", position = "fixed-top", title = NULL,
             
             tabPanel("panel 1", icon = icon("dashboard"),
                      
                      h3("Gauge demo"),
                      
                      fluidRow(
                        
                        column(3,
                               div( h4("Total", style = "text-align:center"),
                                    C3GaugeOutput("Gauge1", height = 150),
                                    style = "width:75%; margin: auto")),
                        
                        column(3,
                               div( h4("last 90 days", style = "text-align:center"),
                                    C3GaugeOutput("Gauge2", height = 150),
                                    style = "width:75%; margin: auto")),
                        
                        column(3,
                               div( h4("last 30 days", style = "text-align:center"),
                                    C3GaugeOutput("Gauge3", height = 150),
                                    style = "width:75%; margin: auto")),
                        
                        column(3,
                               div( h4("last 6 days", style = "text-align:center"),
                                    C3GaugeOutput("Gauge4", height = 150),
                                    style = "width:75%; margin: auto"))
                      )
                      
             )
  ))