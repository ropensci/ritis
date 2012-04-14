#' Provides a list of all the unique kingdom names contained in the database, 
#'  their kingdom IDs and their TSNs. 
#'
#' @import XML RCurl
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @details Note: Kingdom ID values are provided for sorting purposes only and 
#'  are not guaranteed to remain the same through database updates.
#' @export
#' @examples \dontrun{
#' getkingdomnames()
#' }
getkingdomnames <- function(
   url = 'http://www.itis.gov/ITISWebService/services/ITISService/getKingdomNames',
   ..., curl = getCurlHandle() ) 
{
  message(url)
  tt <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- xmlParse(tt)
  namespaces <- c(ax25="http://metadata.itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax25:kingdomId", namespaces=namespaces)
  kingdomId <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax25:kingdomName", namespaces=namespaces)
  kingdomName <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax25:tsn", namespaces=namespaces)
  tsn <- sapply(nodes, xmlValue)
  data.frame(kingdomId = kingdomId, kingdomName = kingdomName, tsn = tsn)
}