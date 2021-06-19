#' #Show basic info about a dataframe
#'
#' @param df A dataframe
#' @param x column to plot on the x-axis
#' @param y column to plot on the y-axis
#'
#' @return Summary statistics per column and a basic dot plot.
#' @export
#'
#' @examples
general_inspection <- function(df, x, y){

  defined <- ls()
  passed <- names(as.list(match.call())[-1])

  dim <- dim(df)
  name <-deparse(substitute(df))

  paste("The data frame", name, "has", as.character(dim[2]), "columns:", stringr::str_c(names(df), collapse = ", ")) %>% print()
  paste("And", as.character(dim[1]), "rows") %>% print()

  df %>% summary() %>% print()

  if (any(!defined %in% passed)) {
    warning(paste("missing values for", paste(setdiff(defined, passed), collapse = ", ")))
  }
  else {
    ggplot2::ggplot(df, ggplot2::aes(x = x, y = y)) +
      ggplot2::geom_point()
  }

}
