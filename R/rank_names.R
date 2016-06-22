#' Provides a list of all the unique rank names contained in the database and
#'  their kingdom and rank ID values.
#'
#' @export
#' @template common
#' @return a data.frame, with columns:
#' \itemize{
#'  \item kingdomname
#'  \item rankid
#'  \item rankname
#' }
#' @examples \dontrun{
#' rank_names()
#' }
rank_names <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getRankNames", list(), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- parse_raw(out)$rankNames
  tibble::as_data_frame(pick_cols(
    x,
    c("kingdomName", "rankId", "rankName")
  ))
}
