#' Provides a list of all the unique valid credibility rating values contained 
#' 		in the database.
#' 
#' @import XML RCurl
#' @param url the ITIS API url for the function (should be left to default)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getcredibilityratings()
#' }
getcredibilityratings <- function(
   url='http://www.itis.gov/ITISWebService/services/ITISService/getCredibilityRatings') 
{
  message(url)
  tt <- getURL(url)
  out <- xmlParse(tt)
  namespaces <- c(ax25="http://metadata.itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax25:credibilityValues", namespaces=namespaces)
  credibilityValues <- sapply(nodes, xmlValue)
  data.frame(credibilityValues = credibilityValues)
}