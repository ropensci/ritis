#' Returns the kingdom and rank information for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @return a data.frame, with rank name and other info
#' @examples \dontrun{
#' rank_name(tsn = 202385)
#' }
rank_name <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTaxonomicRankNameFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- parse_raw(wt, out)
  tibble::as_data_frame(pick_cols(
    data.frame(x, stringsAsFactors = FALSE),
    c("kingdomId","kingdomName","rankId","rankName","tsn")
  ))
}
