#' Get coverge from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' # coverage data
#' coverage(tsn=28727)
#' # no coverage data
#' coverage(526852)
#' coverage(526852, wt = "xml")
#' }
coverage <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getCoverageFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  dr_op(tibble::as_data_frame(parse_raw(wt, out)), "class")
}
