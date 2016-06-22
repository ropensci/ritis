#' Get currency from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @return a data.frame
#' @examples \dontrun{
#' # currency data
#' currency(tsn=28727)
#' currency(tsn=28727, wt = "xml")
#' # no currency dat
#' currency(526852)
#' currency(526852, raw = TRUE)
#' }
currency <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getCurrencyFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  res <- parse_raw(out)
  if (is.null(res$taxonCurrency)) res$taxonCurrency <- ""
  dr_op(tibble::as_data_frame(res), "class")
}
