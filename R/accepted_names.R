#' Get accepted names from tsn
#'
#' @export
#' @param wt (character) One of "json" or "xml". Required.
#' @param raw (logical) Return raw JSON or XML as character string. Required.
#' Default: `FALSE`
#' @param ... curl options passed on to [crul::HttpClient]
#' @template tsn
#' @return Zero row data.frame if the name is accepted, otherwise a data.frame
#' with information on the currently accepted name
#' @examples \dontrun{
#' # TSN accepted - good name, empty data.frame returned
#' accepted_names(tsn = 208527)
#'
#' # TSN not accepted - input TSN is old name, non-empty data.frame returned
#' accepted_names(tsn = 504239)
#'
#' # raw json
#' accepted_names(tsn = 208527, raw = TRUE)
#' }
accepted_names <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getAcceptedNamesFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  tmp <- parse_raw(out)
  if (all(is.na(tmp$acceptedNames))) {
    tibble::tibble()
  } else {
    dr_op(tibble::as_tibble(tmp$acceptedNames), "class")
  }
}
