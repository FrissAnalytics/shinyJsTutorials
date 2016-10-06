#' Create a C3 proxy object
#'
#' @param id name of the C3 widget
#' @param session valid session object
#'
#' @return C3 proxy object
#' @export
c3ChartProxy <- function(id, session = shiny::getDefaultReactiveDomain()){

  object        <- list( id = id, session = session )
  class(object) <- "c3ChartProxy"

  return(object)
}
