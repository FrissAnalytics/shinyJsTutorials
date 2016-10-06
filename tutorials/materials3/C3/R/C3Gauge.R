#' C3Gauge widget
#'
#' C3Gauge widget
#'
#' @param value value of gauge
#' @param width chart width
#' @param height chart height
#'
#' @import htmlwidgets
#'
#' @export
C3Gauge <- function(value, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    data = value
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'C3Gauge',
    x,
    width = width,
    height = height,
    package = 'C3'
  )
}

#' Shiny bindings for C3Gauge
#'
#' Output and render functions for using C3Gauge within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a C3Gauge
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name C3Gauge-shiny
#'
#' @export
C3GaugeOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'C3Gauge', width, height, package = 'C3')
}

#' @rdname C3Gauge-shiny
#' @export
renderC3Gauge <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, C3GaugeOutput, env, quoted = TRUE)
}
