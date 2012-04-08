#' Returns the taxon currency information for the TSN. 
#'
#' This information is  available for Genus and above (rank_id > 190) only.
#' @import XML RCurl
#' @param tsn TSN for a taxonomic group (numeric)
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getcurrencyfromtsn(tsn = 28727) # currency data
#' getcurrencyfromtsn(tsn = 526852) # no currency dat
#' }
getcurrencyfromtsn <- function(tsn = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/getCurrencyFromTSN',
  ..., curl = getCurlHandle() ) 
{
  args <- list()
  if(!is.na(tsn))
    args$tsn <- tsn
  message(paste(url, '?tsn=', tsn, sep=''))
  tt <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- xmlParse(tt)
  nodes <- getNodeSet(out, "//ax23:rankId", namespaces=namespaces)
  rankid <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:taxonCurrency", namespaces=namespaces)
  taxoncurrency <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:tsn", namespaces=namespaces)
  tsn <- sapply(nodes, xmlValue)
  data.frame(rankid=rankid, taxoncurrency=taxoncurrency, tsn=tsn)
}