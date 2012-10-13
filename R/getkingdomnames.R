#' Provides a list of all the unique kingdom names contained in the database, 
#'  their kingdom IDs and their TSNs. 
#'
#' @import XML RCurl
#' @param url the ITIS API url for the function (should be left to default)
#' @return A data.frame with results.
#' @details Note: Kingdom ID values are provided for sorting purposes only and 
#'  are not guaranteed to remain the same through database updates.
#' @export
#' @examples \dontrun{
#' getkingdomnames()
#' }
getkingdomnames <- function(
   url = 'http://www.itis.gov/ITISWebService/services/ITISService/getKingdomNames') 
{
  message(url)
  tt <- getURL(url)
  out <- xmlParse(tt)
  namespaces <- c(ax23="http://metadata.itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax23:kingdomId", namespaces=namespaces)
  kingdomId <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:kingdomName", namespaces=namespaces)
  kingdomName <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:tsn", namespaces=namespaces)
  tsn <- sapply(nodes, xmlValue)
  data.frame(kingdomId = kingdomId, kingdomName = kingdomName, tsn = tsn)
}