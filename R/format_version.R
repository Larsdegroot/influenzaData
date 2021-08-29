#' Formats package names
#'
#' This function formats a typical code chunk that loads packages with their current version number. It outputs into the console so that it may be copy pasted into a RMD code chunk.
#'
#' @param packages string vector
#'
#' @return output in console
#' @export
#'
#' @examples
#' pack <- c("dplyr", "utils")
#' format_version(packages = pack)
format_version <- function(packages){

  ver_num = c()

  for (p in packages){
    ver_num <- append(ver_num, as.character(utils::packageVersion(p)))
  }

  pck <- packages
  index <- seq(length(packages))

  for (i in index){
    cat(paste0("library(", pck[i], ")", " #", ver_num[i], "\n"))
  }

}
