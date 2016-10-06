shinyUI(

  navbarPage(id="main", windowTitle = "Friss", position = "fixed-top", title = NULL,

   header = FrissHeader,

   tabPanel("C3 htmlwidgets demo", icon = icon("dashboard"),

      # Add introJS to the page
      addIntroJS(),

      br(),

      h3c("C3 animated gauges"),

      fluidRow(

        column(3,
        div( h4c("Total"),
             C3GaugeOutput("Gauge1", height = 150), style = "width:75%; margin: auto")),

        column(3,
        div( h4c("last 90 days"),
             C3GaugeOutput("Gauge2", height = 150), style = "width:75%; margin: auto")),

        column(3,
        div( h4c("last 30 days"),
             C3GaugeOutput("Gauge3", height = 150), style = "width:75%; margin: auto")),

        column(3,
        div( h4c("last 7 days"),
             C3GaugeOutput("Gauge4", height = 150), style = "width:75%; margin: auto"))
      ),

      br(),

      h3c("C3 animated pie charts"),

      fluidRow(
        column(3,
               h4c("Process"),
               C3PieOutput("PieProcess",height = 250)
        ),
        column(3,
               h4c("Label"),
               C3PieOutput("PieLabel",height = 250)
        ),
        column(3,
               h4c("Product"),
               C3PieOutput("PieProduct",height = 250)
        ),
        column(3, style = "overflow: hidden;",
               h4c("Branch"),
               C3PieOutput("PieBranch",height = 250)
        )
      ),

      br(),

      h3c("C3 animated combination chart"),

      fluidRow(
        C3LineBarChartOutput("lineBarChart", height=250)
      ),

      br(),

      h3c("C3 animated stacked area chart"),

      fluidRow(
        C3StackedAreaChartOutput("stackedAreaChart", height=250)
      )

   )
))
