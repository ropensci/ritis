#' Get all possible geographic values
#'
#' @export
#' @inheritParams accepted_names
#' @return character vector of geographic names
#' @examples \dontrun{
#' geographic_values()
#' geographic_values(wt = "xml")
#' geographic_values(wt = "json", raw = TRUE)
#' }
geographic_values <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getGeographicValues", list(), wt, ...)
  if (raw || wt == "xml") return(out)
  parse_raw(out)$geographicValues
}
