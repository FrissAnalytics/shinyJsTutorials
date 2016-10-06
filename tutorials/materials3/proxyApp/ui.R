shinyUI(

  navbarPage(id="main", windowTitle = "Friss", position = "fixed-top", title = NULL,

   header = FrissHeader,

   tabPanel("C3 proxy demo", icon = icon("dashboard"),

            C3StackedChartOutput("chart"),

            br(),

            div(style = "padding:4px",
                bsButton("update1","go to first half of the month", size = "extra-small"),
                bsButton("update2","go to second half of the month", size = "extra-small"),
                bsButton("update3","go to first half of the month and update colors", size = "extra-small"),
                bsButton("update4","update colors", size = "extra-small"),
                bsButton("update5","reset chart colors", size = "extra-small"),
                bsButton("update6","reset zoom domain", size = "extra-small"),
                bsButton("update7","group data1 & data2", size = "extra-small"),
                bsButton("spline","transform to spline plot", size = "extra-small", style = "success"),
                bsButton("line","transform to line plot", size = "extra-small", style = "success"),
                bsButton("bar","transform to bar plot", size = "extra-small", style = "success"),
                bsButton("area","transform to area plot", size = "extra-small", style = "success"),
                bsButton("area_spline","transform to area-spline plot", size = "extra-small", style = "success"),
                bsButton("reset","reset chart", size = "extra-small",style = "warning")
            ),

            br(),

            fluidRow(
              column(2, selectInput("dataset", "dataset", choices = c("data1","data2","data3"))),
              column(2, selectInput("type"   , "type"   , choices = c("spline", "line", "bar", "area", "area-spline"))),
              column(2, div( style = "padding-top: 25px", bsButton("update_type",label = "update type", size = "extra-small", style = "primary"))),
              column(3, offset = 3,
                     selectInput("stack", label = "stack"  , choices = c("data1","data2","data3"), selected = c("data1","data2","data3"), multiple = TRUE)
              )
            ),

            br()
   )
))
