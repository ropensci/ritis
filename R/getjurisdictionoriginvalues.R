#' Provides a list of all the unique origin values contained in the database.
#' 
#' @import XML RCurl
#' @param url the ITIS API url for the function (should be left to default)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getjurisdictionoriginvalues()
#' }
getjurisdictionoriginvalues <- function(
   url = 'http://www.itis.gov/ITISWebService/services/ITISService/getJurisdictionalOriginValues') 
{
  message(url)
  tt <- getURL(url)
  out <- xmlParse(tt)
  namespaces <- c(ax23="http://metadata.itis_service.itis.usgs.org/xsd" )
  nodes <- getNodeSet(out, "//ax23:jurisdiction", namespaces=namespaces)
  jurisdiction <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:origin", namespaces=namespaces)
  origin <- sapply(nodes, xmlValue)
  data.frame(jurisdiction = jurisdiction, origin = origin)
}