#' Creates an example input binding.
#' This binding consists of a simple div that will generate a random number each time it is clicked
#'
#' @param inputId id for the component
#' @param choices list with choices that should be available for the buttongroup
#' @param selected list with values that should already be selected
#' @export
buttonGroup <- function(inputId,choices,selected=NA) {

  addResourcePath(
    prefix = 'wwwComponent',
    directoryPath = system.file('www', package='buttonGroup'))

  tagList(
    div( id = inputId, class = "friss_btn_group btn-group btn-group-xs", role="group",
         lapply(choices,function(item){

           class <- "btn btn-default"

           if( item %in% selected) class <- paste(class, "active")

           tags$button(type="button", class = class, "data-value" = item, item)
         })
    ),

    tags$script(src="wwwComponent/buttonGroupBinding.js"),
    tags$link(rel="stylesheet", type="text/css", href="wwwComponent/buttonGroup.css")
  )

}
