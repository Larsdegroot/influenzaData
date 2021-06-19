#' Count and identify the factors of a column
#'
#' @param x A dataframe column or vector
#'
#' @return Text showing the amount of factors and which factors. Not useful for piping.
#' @export
#'
#' @examples
#' some_levels <- as.factor(c("A", "A", "B", "C"))
#' amount_factor(some_levels)
amount_factor <- function(x){
  name <-deparse(substitute(x))
  length <- x %>% as.factor() %>% levels() %>% length()

  paste(name, "has", length, "levels:", sep = " ") %>% print()
  x %>% as.factor() %>% levels() %>% print()

}
