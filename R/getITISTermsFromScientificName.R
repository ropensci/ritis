#' Retrieve accepted TSN (with accepted name)
#' @import XML RCurl
#' @param srchkey search text of scientific name (character)
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getitistermsfromscientificname("ursidae")
#' }
getitistermsfromscientificname <- function(srchkey = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName',
  ..., curl = getCurlHandle() ) 
{
  args <- list()
  if(!is.na(srchkey))
    args$srchKey <- srchkey
  tt <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- xmlParse(tt)
  namespaces <- c(ax23="http://data.itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax23:commonNames", namespaces=namespaces)
  comname <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:nameUsage", namespaces=namespaces)
  nameusage <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:scientificName", namespaces=namespaces)
  sciname <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:tsn", namespaces=namespaces)
  tsn <- sapply(nodes, xmlValue)
  data.frame(comname=comname[-length(comname)], nameusage=nameusage, sciname=sciname, tsn=tsn)
}