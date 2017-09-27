#' Get description of the ITIS service
#'
#' @export
#' @inheritParams accepted_names
#' @return a string, the ITIS web service description
#' @examples \dontrun{
#' description()
#' description(wt = "xml")
#' }
description <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getDescription", list(), wt, ...)
  if (raw || wt == "xml") return(out)
  parse_raw(out)$description
}
