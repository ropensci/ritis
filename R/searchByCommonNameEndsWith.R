# searchByCommonNameEndsWith.R

searchByCommonNameEndsWith <- 
# Args:
#   srchKey: string with search text (character)
# Output: data.frame
# Examples:
#   searchByCommonNameEndsWith("grizzly bear")

function(srchKey = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/searchByCommonNameEndsWith',
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
  data.frame(comname=comname, lang=lang, tsn=tsn[-length(tsn)])
}

# http://www.itis.gov/ITISWebService/services/ITISService/searchByCommonNameEndsWith?srchKey=grizzly%20bear