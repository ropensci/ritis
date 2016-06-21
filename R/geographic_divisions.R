#' Get geographic divisions from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' geographic_divisions(tsn=180543, config=timeout(3))
#' }
geographic_divisions <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getGeographicDivisionsFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("geographicValue","updateDate")
  itis_parse(toget, out, namespaces)
}
