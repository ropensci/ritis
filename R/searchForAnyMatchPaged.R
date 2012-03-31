#' Retrieve accepted TSN (with accepted name)
#' @import XML RCurl
#' @param srchkey text or taxonomic serial number (TSN) (character or numeric)
#' @param pagesize An integer containing the page size (numeric)
#' @param pagenum An integer containing the page number (numeric)
#' @param ascend A boolean containing true for ascending sort order or false for descending (logical)
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return List of output elements.
#' @export
#' @examples \dontrun{
#' searchforanymatchpaged(202385, 100, 1, FALSE)
#' }
searchforanymatchpaged <- function(srchkey = NA, pagesize = NA, pagenum = NA, ascend = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/searchForAnyMatchPaged',
  ..., curl = getCurlHandle() ) 
{
  args <- list()
  if(!is.na(srchkey))
    args$srchKey <- srchkey
  if(!is.na(pagesize))
    args$pageSize <- pagesize
  if(!is.na(pagenum))
    args$pageNum <- pagenum
  if(!is.na(ascend))
    args$ascend <- ascend
  tt <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- xmlParse(tt)
  namespaces <- c(ax23="http://data.itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax23:commonName", namespaces=namespaces)
  comname <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:language", namespaces=namespaces)
  lang <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:tsn", namespaces=namespaces)
  tsn <- sapply(nodes, xmlValue) # last one is a repeat
  nodes <- getNodeSet(out, "//ax23:sciName", namespaces=namespaces)
  sciName <- sapply(nodes, xmlValue)
  list(comname=comname, lang=lang, tsn=tsn[-length(tsn)], sciName=sciName)
}