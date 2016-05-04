#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
C3PieChart <- function(value, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    value = value
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'C3PieChart',
    x,
    width = width,
    height = height,
    package = 'C3PieChart'
  )
}

#' Shiny bindings for C3PieChart
#'
#' Output and render functions for using C3PieChart within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a C3PieChart
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name C3PieChart-shiny
#'
#' @export
C3PieChartOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'C3PieChart', width, height, package = 'C3PieChart')
}

#' @rdname C3PieChart-shiny
#' @export
renderC3PieChart <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, C3PieChartOutput, env, quoted = TRUE)
}
