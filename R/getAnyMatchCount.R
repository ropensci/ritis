# getAnyMatchCount.R

getAnyMatchCount <- 
# Args:
#   srchKey: text or taxonomic serial number (TSN) (character or numeric)
# Output: An integer containing the number of matches the search will return.
# Examples:
#   getAnyMatchCount(202385)
#   getAnyMatchCount("dolphin")

function(srchKey = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/getAnyMatchCount',
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
  xmlToList(out)
}

# http://www.itis.gov/ITISWebService/services/ITISService/getAnyMatchCount?srchKey=202385