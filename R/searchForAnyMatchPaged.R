# searchForAnyMatchPaged.R

searchForAnyMatchPaged <- 
# Args:
#   srchKey: text or taxonomic serial number (TSN) (character or numeric)
#   pageSize: An integer containing the page size (numeric)
#   pageNum: An integer containing the page number (numeric)
#   ascend: A boolean containing true for ascending sort order or false for descending (logical)
# Output: list of output elements
# Examples:
#   searchForAnyMatchPaged(202385, 100, 1, FALSE)
#   searchForAnyMatchPaged(srchKey = "dolphin")

function(srchKey = NA, pageSize = NA, pageNum = NA, ascend = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/searchForAnyMatchPaged',
  ..., 
  curl = getCurlHandle() ) 
{
  args <- list()
  if(!is.na(srchKey))
    args$srchKey <- srchKey
  if(!is.na(pageSize))
    args$pageSize <- pageSize
  if(!is.na(pageNum))
    args$pageNum <- pageNum
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

# http://www.itis.gov/ITISWebService/services/ITISService/searchForAnyMatchPaged?srchKey=202385&pageSize=100&pageNum=1&ascend=false 