#' Provides a list of the unique languages used in the vernacular table.
#'
#' @export
#' @template common
#' @examples \dontrun{
#' vernacular_languages()
#' }
vernacular_languages <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getVernacularLanguages", list(), wt, ...)
  namespaces <- c(ax21 = "http://metadata.itis_service.itis.usgs.gov/xsd")
  languageNames <- xml2::xml_text(xml2::xml_find_all(out, "//ax21:languageNames", namespaces))
  data.frame(languagenames = languageNames, stringsAsFactors = FALSE)
}
