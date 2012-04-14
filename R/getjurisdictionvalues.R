#' Provides a list of all the unique jurisdiction values contained in the database.
#' 
#' @import XML RCurl
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getjurisdictionvalues()
#' }
getjurisdictionvalues <- function(
   url = 'http://www.itis.gov/ITISWebService/services/ITISService/getJurisdictionValues',
   ..., curl = getCurlHandle() ) 
{
  message(url)
  tt <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- xmlParse(tt)
  namespaces <- c(ax25="http://metadata.itis_service.itis.usgs.org/xsd" )
  nodes <- getNodeSet(out, "//ax25:jurisdictionValues", namespaces=namespaces)
  jurisdictionValues <- sapply(nodes, xmlValue)
  data.frame(jurisdictionValues = jurisdictionValues)
}