# getITISTermsFromScientificName.R

getITISTermsFromScientificName <- 
# Args:
#   srchKey: search text of scientific name (character)
# Output: A data.frame with results. 
# Examples:
#   getITISTermsFromScientificName("ursidae")

function(srchKey = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName',
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

# http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName?srchKey=ursidae