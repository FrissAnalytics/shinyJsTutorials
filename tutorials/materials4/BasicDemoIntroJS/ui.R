shinyUI(fluidPage(
  
   # Include IntroJS styling
   includeCSS("introjs.min.css"),
   
   # Include styling for the app
   includeCSS("app.css"),
   
   # Include IntroJS library
   includeScript("intro.min.js"),
   
   # Include javascript code to make shiny communicate with introJS
   includeScript("app.js"),
   
   # setup grid
   # row 1
   fluidRow(
     column(4, div(id="step1", class="well", "element1")),
     column(4, div(id="step2", class="well", "element2")),
     column(4, div(id="step3", class="well", "element3"))
   ),
   
   # row 2
   fluidRow(
     column(4, div(id="step4", class="well", "element4")),
     column(4, div(id="step5", class="well", "element5")),
     column(4, div(id="step6", class="well", "element6"))
   ),
   
   # row 3
   fluidRow(
     column(4, div(id="step7", class="well", "element7")),
     column(4, div(id="step8", class="well", "element8")),
     column(4, div(id="step9", class="well", "element9"))
   ),
   
   # centered botton
   div(class="flexcontainer", 
       
       # action button
       actionButton(inputId="startHelp", label="start", class="btn-success")
   )
  )
)
