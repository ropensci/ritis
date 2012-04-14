#' Provides the date the ITIS database was last updated.
#'
#' @import XML RCurl
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getlastchangedate()
#' }
getlastchangedate <- function(
   url = 'http://www.itis.gov/ITISWebService/services/ITISService/getLastChangeDate',
   ..., curl = getCurlHandle() ) 
{
  message(url)
  tt <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- xmlParse(tt)
  namespaces <- c(ax25="http://metadata.itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax25:updateDate", namespaces=namespaces)
  sapply(nodes, xmlValue)
}