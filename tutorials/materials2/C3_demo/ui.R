shinyUI(

  navbarPage(id="main", windowTitle = "Friss", position = "fixed-top", title = NULL,

   header = FrissHeader,

   tabPanel("C3 htmlwidgets demo", icon = icon("dashboard"),

      br(),
            
      h3( style ="text-align:center", "C3 animated gauges"),
      
      fluidRow(

        column(3,
        div( h4("Total", style = "text-align:center"),
             C3GaugeOutput("Gauge1", height = 150), style = "width:75%; margin: auto")),

        column(3,
        div( h4("last 90 days", style = "text-align:center"),
             C3GaugeOutput("Gauge2", height = 150), style = "width:75%; margin: auto")),

        column(3,
        div( h4("last 30 days", style = "text-align:center"),
             C3GaugeOutput("Gauge3", height = 150), style = "width:75%; margin: auto")),

        column(3,
        div( h4("last 7 days", style = "text-align:center"),
             C3GaugeOutput("Gauge4", height = 150), style = "width:75%; margin: auto"))
      ),

      br(),
      
      h3( style ="text-align:center", "C3 animated pie charts"),
      
      fluidRow(
        column(3,
               h4("Process", style = "text-align:center"),
               C3PieOutput("PieProcess",height = 250)
        ),
        column(3,
               h4("Label", style = "text-align:center"),
               C3PieOutput("PieLabel",height = 250)
        ),
        column(3,
               h4("Product", style = "text-align:center"),
               C3PieOutput("PieProduct",height = 250)
        ),
        column(3, style = "overflow: hidden;",
               h4("Branch", style = "text-align:center"),
               C3PieOutput("PieBranch",height = 250)
        )
      ),

      br(),
      
      h3( style ="text-align:center", "C3 animated combination chart"),
      
      fluidRow(
        C3LineBarChartOutput("lineBarChart", height=250)
      ),

      br(),
      
      h3( style ="text-align:center", "C3 animated stacked area chart"),
      
      fluidRow(
        C3StackedAreaChartOutput("stackedAreaChart", height=250)
      )

   )
))
