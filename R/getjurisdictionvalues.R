#' Provides a list of all the unique jurisdiction values contained in the database.
#' 
#' @import XML RCurl
#' @param url the ITIS API url for the function (should be left to default)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getjurisdictionvalues()
#' }
getjurisdictionvalues <- function(
   url = 'http://www.itis.gov/ITISWebService/services/ITISService/getJurisdictionValues') 
{
  message(url)
  tt <- getURL(url)
  out <- xmlParse(tt)
  namespaces <- c(ax23="http://metadata.itis_service.itis.usgs.org/xsd" )
  nodes <- getNodeSet(out, "//ax23:jurisdictionValues", namespaces=namespaces)
  jurisdictionValues <- sapply(nodes, xmlValue)
  data.frame(jurisdictionValues = jurisdictionValues)
}