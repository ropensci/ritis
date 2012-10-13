#' Provides a list of the unique languages used in the vernacular table.
#'
#' @import XML RCurl
#' @param url the ITIS API url for the function (should be left to default)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getvernacularlanguages()
#' }
getvernacularlanguages <- function(
   url = 'http://www.itis.gov/ITISWebService/services/ITISService/getVernacularLanguages') 
{
  message(url)
  tt <- getURL(url)
  out <- xmlParse(tt)
  namespaces <- c(ax23="http://metadata.itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax23:languageNames", namespaces=namespaces)
  languageNames <- sapply(nodes, xmlValue)
  data.frame(languageNames = languageNames)
}