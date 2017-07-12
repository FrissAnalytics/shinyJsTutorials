#' bootstrapSwitch
#'
#' initialize a bootstrapSwitch
#'
#' @description creates a bootstrapSwitch component
#' @param inputId inputId used by Shiny
#' @param label The label for our switch
#' @param width the width of our component
#' @param state the state of the component which should either be TRUE or FALSE
#' @param size bootstap size parameter
#' @param onColor The color the switch shoudl have in on state
#' @param offColor The color the switch shoudl have in off state
#'
#' @export

bootstrapSwitch <- function(inputId, label, state = TRUE, width = "auto", size = "mini", onColor = "success", offColor = "danger") {

  addResourcePath(
    prefix = 'wwwFrissSwitch',
    directoryPath = system.file('www', package='BootstrapSwitch')
  )

  tagList(

    singleton(tags$head(
      tags$script(src="wwwFrissSwitch/bootstrap-switch.min.js"),
      tags$script(src="wwwFrissSwitch/BootstrapSwitchBinding.js"),
      tags$link(rel="stylesheet", type="text/css", href="wwwFrissSwitch/bootstrap-switch.min.css")
    )),

    tags$input(type = "checkbox", id = inputId, class = "FrissSwitch",
               "data-state" = tolower(state),
               "data-size" = size,
               "data-label-width" = width,
               "data-on-color" = onColor,
               "data-off-color" = offColor,
               "data-label-text" = label)
  )
}
