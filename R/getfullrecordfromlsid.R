#' Returns the full ITIS record for the TSN in the LSID, found by comparing the 
#'  TSN in the search key to the TSN field. Returns an empty result set if there 
#'  is no match or the TSN is invalid.
#' @import XML RCurl
#' @param lsid lsid for a taxonomic group (character)
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getfullrecordfromlsid(lsid = "urn:lsid:itis.gov:itis_tsn:180543")
#' }
getfullrecordfromlsid <- function(lsid = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/getFullRecordFromLSID',
  ..., curl = getCurlHandle() ) 
{
  args <- list()
  if(!is.na(lsid))
    args$lsid <- lsid
  message(paste(url, '?lsid=', lsid, sep=''))
  tt <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  message("\n\n what more refined output do you want? [myrmecocystus@gmail.com] \n\n")
  xmlParse(tt)
}