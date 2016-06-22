#' Returns the usage information for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' usage(tsn = 526852)
#' usage(tsn = 526852, raw = TRUE)
#' usage(tsn = 526852, wt = "xml")
#' }
usage <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTaxonomicUsageFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  dr_op(tibble::as_data_frame(parse_raw(wt, out)), "class")
}
