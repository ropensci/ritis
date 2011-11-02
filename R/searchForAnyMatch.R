# searchForAnyMatch.R

searchForAnyMatch <- 
# Args:
#   srchKey: text or taxonomic serial number (TSN) (character or numeric)
# Output: list of output
# Examples:
#   searchForAnyMatch(srchKey = 202385)
#   searchForAnyMatch(srchKey = "dolphin")

function(srchKey = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/searchForAnyMatch',
  ..., 
  curl = getCurlHandle() ) 
{
  args <- list()
  if(!is.na(srchKey))
    args$srchKey <- srchKey
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

# http://www.itis.gov/ITISWebService/services/ITISService/searchForAnyMatch?srchKey=dolphin