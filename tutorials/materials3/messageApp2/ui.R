shinyUI(
  bootstrapPage(
    
    # include css
    includeCSS("www/style.css"),
    
    # include the message.js script so the JavaScript knows the custom message handler we have written
    includeScript("www/message.js"),
    
    div( id = "container", 
      
      # image of rstudio logo
      img(src = "RStudio-Ball.png", id = "RStudio"),
      
      # text output
      textOutput("text")
    
    )
  )
)