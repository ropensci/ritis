#' Provides a list of all the unique rank names contained in the database and 
#'  their kingdom and rank ID values.
#'
#' @import XML RCurl
#' @param url the ITIS API url for the function (should be left to default)
#' @return A data.frame with results.
#' @details Note: Rank ID values are provided for sorting purposes only and 
#'  are not guaranteed to remain the same through database updates.
#' @export
#' @examples \dontrun{
#' getranknames()
#' }
getranknames <- function(
   url = 'http://www.itis.gov/ITISWebService/services/ITISService/getRankNames') 
{
  message(url)
  tt <- getURL(url)
  out <- xmlParse(tt)
  namespaces <- c(ax25="http://metadata.itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax25:kingdomName", namespaces=namespaces)
  kingdomName <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax25:rankId", namespaces=namespaces)
  rankId <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax25:rankName", namespaces=namespaces)
  rankName <- sapply(nodes, xmlValue)
  data.frame(kingdomName = kingdomName, rankId = rankId, rankName = rankName)
}