#' Provides a description of the web service and the ITIS database.
#' 
#' @import XML RCurl
#' @param url the ITIS API url for the function (should be left to default)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getdescription()
#' }
getdescription <- function(
   url = 'http://www.itis.gov/ITISWebService/services/ITISService/getDescription') 
{
  message(url)
  tt <- getURL(url)
  out <- xmlParse(tt)
  namespaces <- c(ax26="http://itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax26:description", namespaces=namespaces)
  sapply(nodes, xmlValue)
}