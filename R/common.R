#' Looks which element of a vector two vectors have in common
#'
#' @param pattern Pattern to find in x. can either be a single element or a vector
#' @param x Vector to search in.
#'
#' @return A vector contains the elements that the two vectors have in common.
#' @export
#'
#' @examples
#' test1 <- c("A1", "A2", "A3", "A4", "A5")
#' test2 <- c("A1", "A2", "A3", "B4", "B5")
#'
#' common(test1, test2)
common <- function(x, pattern){
  #takes first element of x
  itterations <- seq(from = 1, to =  length(x))
  commons <- c()

  for (i in itterations){
    y <- stringr::str_detect(x[i], pattern)
    if (TRUE == (TRUE %in% y)){
      commons <- append(commons, x[i])
    }
  }

  return(commons)
}
