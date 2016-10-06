shinyServer(function(input, output, session) {
  
  # set help content
  session$sendCustomMessage(type = 'setHelpContent', message = list(steps = toJSON(steps) ))
  
  # listen to the action button
  observeEvent(input$startHelp,{
    
    # on click, send custom message to start help
    session$sendCustomMessage(type = 'startHelp', message = list(""))
    
  })
  
})
