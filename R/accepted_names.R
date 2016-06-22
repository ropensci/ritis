#' Get accepted names from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @return Zero row data.frame if the name is accepted, otherwise a data.frame
#' with information on the currently accepted name
#' @examples \dontrun{
#' # TSN accepted - good name
#' accepted_names(tsn = 208527)
#'
#' # TSN not accepted - input TSN is old name
#' accepted_names(tsn = 504239)
#'
#' # raw json
#' accepted_names(tsn = 208527, raw = TRUE)
#' }
accepted_names <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getAcceptedNamesFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  tmp <- parse_raw(out)
  if (all(is.na(tmp$acceptedNames))) tibble::data_frame() else dr_op(tibble::as_data_frame(tmp$acceptedNames), "class")
}
