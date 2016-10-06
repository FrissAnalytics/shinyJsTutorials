shinyServer(function(input,output,session){
  
  # listen to the action button
  observeEvent(input$btn1,{
    
    # a simple text string
    message = "hello"
    
    # send the message to the event handler with name handler1 if we press the action button
    session$sendCustomMessage("handler1", message)
  })                     
})