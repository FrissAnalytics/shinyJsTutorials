shinyUI(
  bootstrapPage(
    
    # include the message.js script so the JavaScript knows the custom message handler we have written
    includeScript("www/message.js"),
    
    # a normal action button.
    actionButton("btn1","show alert")
  )
)