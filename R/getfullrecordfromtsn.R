#' Get full record from TSN. 
#'
#' Returns the full ITIS record for a TSN found by comparing the search key to the TSN field, or an empty result set if there is no match.
#' @import XML RCurl
#' @param tsn TSN for a taxonomic group (numeric)
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @details Note: Because this API must do multiple database lookups, this can be 
#'   a time-comsuming operation and may take several seconds to return information.
#' @export
#' @examples \dontrun{
#' getfullrecordfromtsn(tsn = 183833)
#' }
getfullrecordfromtsn <- function(tsn = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/getFullRecordFromTSN',
  ..., curl = getCurlHandle() ) 
{
  args <- list()
  if(!is.na(tsn))
    args$tsn <- tsn
  tt <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  xmlParse(tt)
}