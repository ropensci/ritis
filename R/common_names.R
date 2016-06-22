#' Get common names from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @return a data.frame
#' @examples \dontrun{
#' common_names(tsn=183833)
#' common_names(tsn=183833, wt = "xml")
#' }
common_names <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getCommonNamesFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  dr_op(tibble::as_data_frame(parse_raw(wt, out)$commonNames), "class")
}
