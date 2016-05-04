shinyServer(function(input, output, session) {

  output$Gauge1 <- renderC3Gauge({
    invalidateLater(5000, session)
    val <- round(runif(1,min=0,max=100),2)
    C3Gauge(message = val)
  })
  
  output$Gauge2 <- renderC3Gauge({
    invalidateLater(5000, session)
    val <- round(runif(1,min=0,max=100),2)
    C3Gauge(message = val)
  })
  
  output$Gauge3 <- renderC3Gauge({
    invalidateLater(5000, session)
    val <- round(runif(1,min=0,max=100),2)
    C3Gauge(message = val)
  })
  
  output$Gauge4 <- renderC3Gauge({
    invalidateLater(5000, session)
    val <- round(runif(1,min=0,max=100),2)
    C3Gauge(message = val)
  })

})
