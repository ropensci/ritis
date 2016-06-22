#' Returns the review year for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @return a data.frame
#' @examples \dontrun{
#' review_year(tsn = 180541)
#' }
review_year <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getReviewYearFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- tc(parse_raw(wt, out))
  tibble::as_data_frame(pick_cols(
    data.frame(x, stringsAsFactors = FALSE),
    c("rankId","reviewYear","tsn")
  ))
}

