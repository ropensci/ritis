#' Get all possible geographic values
#'
#' @export
#' @template common
#' @examples \dontrun{
#' geographic_values()
#' }
geographic_values <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getGeographicValues", list(), wt, ...)
  namespaces <- c(ax21 = "http://metadata.itis_service.itis.usgs.gov/xsd")
  geographicValues <- xml2::xml_text(xml2::xml_find_all(out, "//ax21:geographicValues", namespaces))
  data.frame(geographicvalues = geographicValues, stringsAsFactors = FALSE)
}
