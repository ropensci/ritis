#' Returns the parent TSN for the entered TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @return a data.frame
#' @examples \dontrun{
#' parent_tsn(tsn = 202385)
#' parent_tsn(tsn = 202385, raw = TRUE)
#' parent_tsn(tsn = 202385, wt = "xml")
#' }
parent_tsn <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getParentTSNFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- parse_raw(out)
  tibble::as_data_frame(pick_cols(
    data.frame(x, stringsAsFactors = FALSE),
    c("parentTsn", "tsn")
  ))
}
