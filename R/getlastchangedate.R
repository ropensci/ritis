#' Provides the date the ITIS database was last updated.
#'
#' @import XML RCurl
#' @param url the ITIS API url for the function (should be left to default)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getlastchangedate()
#' }
getlastchangedate <- function(
   url = 'http://www.itis.gov/ITISWebService/services/ITISService/getLastChangeDate') 
{
  message(url)
  tt <- getURL(url)
  out <- xmlParse(tt)
  namespaces <- c(ax23="http://metadata.itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax23:updateDate", namespaces=namespaces)
  sapply(nodes, xmlValue)
}