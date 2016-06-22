#' Get date data from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' date_data(tsn = 180543)
#' date_data(180543, wt = "xml")
#' date_data(180543, wt = "json", raw = TRUE)
#' }
date_data <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getDateDataFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  dr_op(tibble::as_data_frame(parse_raw(out)), "class")
}
