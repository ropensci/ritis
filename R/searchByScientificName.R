# searchByScientificName.R

searchByScientificName <- 
# Args:
#   srchKey: string with search text (character)
# Output: data.frame
# Examples:
#   searchByScientificName("Tardigrada")

function(srchKey = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/searchByScientificName',
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
  nodes <- getNodeSet(out, "//ax23:combinedName", namespaces=namespaces)
  combinedname <- sapply(nodes, xmlValue)
#   combinedname <- sapply(combinedname, gsub, pattern = " ", replacement = "")
  nodes <- getNodeSet(out, "//ax23:tsn", namespaces=namespaces)
  tsn <- sapply(nodes, xmlValue) # last one is a repeat
  data.frame(combinedname=combinedname, tsn=tsn)
}

# http://www.itis.gov/ITISWebService/services/ITISService/searchByScientificName?srchKey=Tardigrada