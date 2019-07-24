#' Returns the review year for the TSN.
#'
#' @export
#' @inheritParams accepted_names
#' @template tsn
#' @return a data.frame
#' @examples \dontrun{
#' review_year(tsn = 180541)
#' }
review_year <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getReviewYearFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- tc(parse_raw(out))
  tibble::as_tibble(
    tc(pick_cols(x, c("rankId","reviewYear","tsn")))
  )
}

