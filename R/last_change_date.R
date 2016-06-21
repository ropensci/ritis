#' Provides the date the ITIS database was last updated.
#'
#' @export
#' @template common
#' @examples \dontrun{
#' last_change_date(config=timeout(3))
#' }
last_change_date <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getLastChangeDate", list(), wt, ...)
  namespaces <- c(ax21 = "http://metadata.itis_service.itis.usgs.gov/xsd")
  xml2::xml_text(xml2::xml_find_all(out, "//ax21:updateDate", namespaces))
}
