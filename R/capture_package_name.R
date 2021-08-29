#' Capture package names
#'
#' This function takes a typical code chunk containing "library(package name)" as a string as input. It then returns only the package names in this string.
#' This function is meant to be used with format_version()
#'
#' @param string string containing "library(package name)"
#'
#' @return string vector
#' @export
#'
#' @examples
#' str = "library(tidyverse) # 1.3.1 library(readxl) #1.3.1 library(here) #1.0.1"
#' capture_package_name(string = str)
capture_package_name <- function(string){
  str <- strsplit(string, "library")

  #formatting output of strsplit
  str = str[[1]][2:length(str[[1]])]

  #finding locations of ")"
  grep_res = gregexpr(pattern = ")", str)
  str_index = c()


  for (i in seq(length(grep_res))){
    str_index <- append(str_index, grep_res[[i]][1])
  }

  #extracting package name
  package_names = c()

  for (i in seq(length(str_index))){
    package_names <- append(package_names, substr(str[i], 2, str_index[i]-1))
  }

  return(package_names)
}
