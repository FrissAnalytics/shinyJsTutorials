shinyServer(function(input,output,session){
  
  # this block fires each time we receive a message from JavaScript
  output$text <- renderText({
  
   req(input$count)
  
   paste("you clicked", input$count, "times on the RStudio ball")
  })
  
})