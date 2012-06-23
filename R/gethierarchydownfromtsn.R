#' Returns a list of all the valid/accepted scientific names contained within 
#'  a particular valid/accepted scientific name and their TSNs, limited to 
#'  immediate children only. The result set will be found by comparing the 
#'  search key to the parent TSN field.
#'  
#' @import XML RCurl plyr
#' @param tsn TSN for a taxonomic group (numeric)
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' gethierarchydownfromtsn(tsn = 161030)
#' }
gethierarchydownfromtsn <- function(tsn = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/getHierarchyDownFromTSN',
  ..., curl = getCurlHandle() ) 
{
  args <- list()
  if(!is.na(tsn))
    args$tsn <- tsn
  message(paste(url, '?tsn=', tsn, sep=''))
  tt <- getForm(url,
    .params = args,
#     ...,
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