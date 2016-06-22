#' Get geographic divisions from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' geographic_divisions(tsn = 180543)
#'
#' geographic_divisions(tsn = 180543, wt = "xml")
#'
#' geographic_divisions(tsn = 180543, wt = "json", raw = TRUE)
#' }
geographic_divisions <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getGeographicDivisionsFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  res <- parse_raw(out)
  if (inherits(res$geoDivisions, "logical") || is.null(res$geoDivisions)) {
    tibble::data_frame()
  } else {
    dr_op(tibble::as_data_frame(res$geoDivisions), "class")
  }
}
