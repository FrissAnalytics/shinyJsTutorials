shinyServer(function(input, output, session) {

  observe({
    # Index help data into right tab
    indTab <- helpData$tab==input$nav
    
    nextPage <- 2
    
    if(input$nav=="2")
      nextPage <- 1
    
     # set help content
    session$sendCustomMessage(type = 'setHelpContent', message = list(steps = toJSON(helpData[indTab,]) ,nextPage=nextPage))
  })
  
  observeEvent(input$autoStartHelp,{
    if(input$autoStartHelp==0)return()
    # Auto start help if we press nextpage
    session$sendCustomMessage(type = 'startHelp', message = list(""))
  })

  # data for C3LineBarChart & stackedAreaChart
  Data <- reactive({

    invalidateLater(10000, session)

    n         <- 100
    Start    <- as.Date("2016-01-01")
    Time     <- Start + 1:n
    Counts   <- data.frame(
      GREEN = getSeries(n = n, drift = 0.05, walk = 10, scale = 100),
      AMBER = getSeries(n = n, drift = 0.2, walk = 4, scale = 40),
      RED   = getSeries(n = n, drift = 0.1, walk = 4, scale = 20)
    )

    Total  <- apply(Counts,1,sum)
    Perc   <- Counts / Total

    list(Counts = Counts, Perc = Perc, Total = Total, Time = Time)
  })

  ###
  ### gauges
  ###

  output$Gauge1 <- renderC3Gauge({
    invalidateLater(10000, session)
    val <- round(runif(1,min=0,max=100),2)
    C3Gauge(value = val)
  })

  output$Gauge2 <- renderC3Gauge({
    invalidateLater(10000, session)
    val <- round(runif(1,min=0,max=100),2)
    C3Gauge(value = val)
  })

  output$Gauge3 <- renderC3Gauge({
    invalidateLater(10000, session)
    val <- round(runif(1,min=0,max=100),2)
    C3Gauge(value = val)
  })

  output$Gauge4 <- renderC3Gauge({
    invalidateLater(10000, session)
    val <- round(runif(1,min=0,max=100),2)
    C3Gauge(value = val)
  })


  ###
  ### pies
  ###

  output$PieProcess <- renderC3Pie({
    invalidateLater(10000, session)

    value <- data.frame(a=runif(1,0,10),b=runif(1,0,10),c=runif(1,0,10))
    C3Pie(value = value)
  })

  output$PieLabel <- renderC3Pie({
    invalidateLater(10000, session)
    value <- data.frame(a=runif(1,0,10),b=runif(1,0,10),c=runif(1,0,10))
    C3Pie(value = value)
  })

  output$PieProduct <- renderC3Pie({
    invalidateLater(10000, session)
    value <- data.frame(a=runif(1,0,10),b=runif(1,0,10),c=runif(1,0,10))
    C3Pie(value = value)
  })

  output$PieBranch <- renderC3Pie({
    invalidateLater(10000, session)
    value <- data.frame(a=runif(1,0,10),b=runif(1,0,10),c=runif(1,0,10))
    C3Pie(value = value)
  })

  ###
  ### lineBarChart
  ###

  output$lineBarChart <- renderC3LineBarChart({

    dataset <- data.frame(Time  = Data()$Time,
                          GREEN = Data()$Perc$GREEN,
                          AMBER = Data()$Perc$AMBER,
                          RED   = Data()$Perc$RED,
                          Total = Data()$Total)

    colors      <- list(Total = "gray", GREEN = "#2CA02C", AMBER = "#FF7F0E", RED = "Red")

    C3LineBarChart(dataset = dataset, colors = colors)
  })

  ###
  ### stackedAreaChart
  ###

  output$stackedAreaChart <- renderC3StackedAreaChart({

    dataset <- data.frame(Time  = Data()$Time,
                          GREEN = Data()$Perc$GREEN,
                          AMBER = Data()$Perc$AMBER,
                          RED   = Data()$Perc$RED)

    colors  <- list(GREEN = "#2CA02C", AMBER = "#FF7F0E", RED = "Red")

    C3StackedAreaChart(dataset,colors)
  })

  # listen to the action button
  observeEvent(input$startHelp,{
  
    # on click, send custom message to start help
    session$sendCustomMessage(type = 'startHelp', message = list(""))
    
  })

})
