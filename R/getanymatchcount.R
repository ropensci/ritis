#' Retrieve accepted TSN (with accepted name)
#' @import XML RCurl
#' @param srchkey text or taxonomic serial number (TSN) (character or numeric)
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return An integer containing the number of matches the search will return.
#' @export
#' @examples \dontrun{
#' getanymatchcount(202385)
#' getanymatchcount("dolphin")
#' }
getanymatchcount <- function(srchkey = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/getAnyMatchCount',
  ..., 
  curl = getCurlHandle() ) 
{
  args <- list()
  if(!is.na(srchkey))
    args$srchKey <- srchkey
  tt <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- xmlParse(tt)
  xmlToList(out)
}