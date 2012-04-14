#' Provides a list of all the unique rank names contained in the database and 
#'  their kingdom and rank ID values.
#'
#' @import XML RCurl
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @details Note: Rank ID values are provided for sorting purposes only and 
#'  are not guaranteed to remain the same through database updates.
#' @export
#' @examples \dontrun{
#' getranknames()
#' }
getranknames <- function(
   url = 'http://www.itis.gov/ITISWebService/services/ITISService/getRankNames',
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
  nodes <- getNodeSet(out, "//ax25:rankId", namespaces=namespaces)
  rankId <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax25:rankName", namespaces=namespaces)
  rankName <- sapply(nodes, xmlValue)
  data.frame(kingdomId = kingdomId, kingdomName = kingdomName, rankId = rankId,
             rankName = rankName)
}