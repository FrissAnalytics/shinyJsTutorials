#' addIntroJS
#'
#' Adds introJS to the shiny app. This function should be called in ui.r
#' This function performs all includes necessary for introJS and puts a green help button on the top right of the screen to start the help.
#' In server a call should be made to startIntroJS when the button is clicked.
#'
#' @param inputID id for the help button
#' @export
addIntroJS <- function(inputId='btnHelp') {

  # When we use the binding in a package we use the add resource path statement
  addResourcePath(
    prefix = 'wwwIntroJS',
    directoryPath = system.file('www', package='FrissIntroJSBasic'))

  # Add includes to the head of the page using the resource path
  tagList(
    singleton(tags$head(
      tags$script(src="wwwIntroJS/intro.min.js"),
      tags$link(rel="stylesheet", type="text/css", href="wwwIntroJS/introjs.min.css"),
      tags$link(rel="stylesheet", type="text/css", href="wwwIntroJS/introjs-friss.css"),
      tags$script(src="wwwIntroJS/IntroJSBinding.js"),
      div(id="helpContainer"),
      actionButton(inputId,'help', style = "background-color:green;color:white;padding:1px;position:fixed;right:20px;top:20px;z-index:100000000000", onclick="startHelp();")
    )))
}

#' Starts Intro JS
#'
#' @param Shiny session id
#' @param dfIntro data frame with three columns: 'intro','element' and 'position'.
#' Each row in this data frame represents an introJS step. The column 'intro' contains the messages to show.
#' 'Element' contains the css selectors for the elements to display the message for. If NA the message will be displayed as general message.
#' 'position' will be the position of the introJS message
#' @param lstDynamicValues list with loopup table consisting of key/value pairs to be replaced in the help text.
#'        This can be used to create data driven help content.
#' @param nextPage value of the next page tab to be displayed when the nextpage button is clicked within the help.
#'        if this value is left empty no next page button will be displayed.
#'
#' @examples \dontrun{
#'  // The folowing example assume a shiny app with that contains two divs with ids 'slider' and 'pie'
#'  // The code should put in server.r
#'
#'  // Construct a data frame for a page containing a div with ID 'slider and a div with id 'pie'
#'  // The first row of the dataframe in this example does not contain an element and will be shown as general message
#'  RV$appHelp <- data.frame(intro=c('General intro message','this is a slider with val %val1%','this is a pie'),element=c(NA,'#slider','#pie'),position=c(NA,NA,'right'),stringsAsFactors=FALSE)
#'  // This second data frame will construct a look up table with dynamic values.
#'  // This will cause %val1% in the help to be replaced by the value 100
#'  lstDynamicValues <- list()
#'  lstDynamicValues['%val1%'] <- '100'
#'
#'  observeEvent(RV$appHelp,{
#'        initIntroJS(session,RV$appHelp,dfDynamicValues)
#'   })
#' }
#'
#' @export
initIntroJS <- function(session,dfIntro){

  lstIntro <- dlply.ordered(dfIntro,1,c)
  lstIntro <- unname(lstIntro)

  listData <- list(steps=lstIntro)

  session$sendCustomMessage("initIntroJS", listData)
}

#' Keeps order while using dlply
#'
#' @param data Dataframe
#' @param ... Parameters passed to dlply
dlply.ordered <- function(data,dim ,...) {
  col <- ".sortColumn"
  data[,col] <- 1:nrow(data)
  out <- dlply(data, dim, ...)
  out <- unname(out)
  dfTemp <- do.call(rbind.data.frame, out)
  if (!col %in% colnames(dfTemp)) stop("Ordering column not preserved by function")
  out <- out[order(dfTemp[,col])]
  out
}
