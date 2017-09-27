#' Returns the kingdom and rank information for the TSN.
#'
#' @export
#' @inheritParams accepted_names
#' @template tsn
#' @return a data.frame, with rank name and other info
#' @examples \dontrun{
#' rank_name(tsn = 202385)
#' }
rank_name <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTaxonomicRankNameFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- parse_raw(out)
  res <- tc(pick_cols(x, c("kingdomId","kingdomName","rankId","rankName","tsn")))
  tibble::as_data_frame(
    if (length(names(res)) == 1) NULL else res
  )
}
