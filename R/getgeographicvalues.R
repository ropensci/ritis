#' Provides a list of all the geographic values contained in the database.
#' 
#' @import XML RCurl
#' @param url the ITIS API url for the function (should be left to default)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getgeographicvalues()
#' }
getgeographicvalues <- function(
   url = 'http://www.itis.gov/ITISWebService/services/ITISService/getGeographicValues') 
{
  message(url)
  tt <- getURL(url)
  out <- xmlParse(tt)
  namespaces <- c(ax23="http://metadata.itis_service.itis.usgs.org/xsd" )
  nodes <- getNodeSet(out, "//ax23:geographicValues", namespaces=namespaces)
  geographicValues <- sapply(nodes, xmlValue)
  data.frame(geographicValues = geographicValues)
}