#' Returns the Taxonomic Hierarchy
#' 
#' Returns the Taxonomic Hierarchy (i.e. the hierarchy from the kingdom to the 
#'    requested scientific name) found by iteratively comparing the TSN to the 
#'    Parent TSN field.
#'    
#' @import XML RCurl
#' @param tsn TSN for a taxonomic group (numeric)
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getfullhierarchyfromtsn(tsn = 37906)
#' getfullhierarchyfromtsn(tsn = 500664)
#' }
getfullhierarchyfromtsn <- function(tsn = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN',
  ..., curl = getCurlHandle() ) 
{
  args <- list()
  if(!is.na(tsn))
    args$tsn <- tsn
  message(paste(url, '?tsn=', tsn, sep=''))
  tt <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- xmlParse(tt)
  namespaces <- c(ax23="http://data.itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax23:parentName", namespaces=namespaces)
  parentName <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:parentTsn", namespaces=namespaces)
  parentTsn <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:rankName", namespaces=namespaces)
  rankName <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:taxonName", namespaces=namespaces)
  taxonName <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:tsn", namespaces=namespaces)
  tsn <- sapply(nodes, xmlValue)
  data.frame(parentName=parentName, parentTsn=parentTsn, rankName=rankName,
             taxonName=taxonName, tsn=tsn[-1])
}