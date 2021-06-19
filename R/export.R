#' Export a dataframe as csv and rds
#'
#' @param x A dataset to export.
#' @param path The file path to export to.
#'
#' @return
#' @export
#'
#' @examples
export <- function(x, path){
  utils::write.csv(x, file = paste0(path, ".csv"))
  saveRDS(x, file = paste0(path, ".rds"))
}
