#' Retrieve accepted TSN (with accepted name)
#' 
#' @import XML RCurl
#' @param srchkey string with search text (character)
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' searchbyscientificname("Tardigrada")
#' searchbyscientificname("Quercus douglasii")
#' }
searchbyscientificname <- function(srchkey = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/searchByScientificName',
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
  nodes <- getNodeSet(out, "//ax23:combinedName", namespaces=namespaces)
  combinedname <- sapply(nodes, xmlValue)
#   combinedname <- sapply(combinedname, gsub, pattern = " ", replacement = "")
  nodes <- getNodeSet(out, "//ax23:tsn", namespaces=namespaces)
  tsn <- sapply(nodes, xmlValue) # last one is a repeat
  data.frame(combinedname=combinedname, tsn=tsn)
}