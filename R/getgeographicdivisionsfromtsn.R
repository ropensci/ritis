#' Returns a list of the geographic divisions for the TSN.
#' @import XML RCurl plyr
#' @param tsn TSN for a taxonomic group (numeric)
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getgeographicdivisionsfromtsn(tsn = 180543)
#' }
getgeographicdivisionsfromtsn <- function(tsn = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/getGeographicDivisionsFromTSN',
  ..., curl = getCurlHandle() ) 
{
  args <- list()
  if(!is.na(tsn))
    args$tsn <- tsn
  message(paste(url, '?tsn=', tsn, sep=''))
  tt <- getForm(url,
    .params = args,
#     ...,
    curl = curl)
  out <- xmlParse(tt)
  namespaces <- c(ax23="http://data.itis_service.itis.usgs.org/xsd")
  toget <- list("geographicValue","updateDate","tsn")
  xpathfunc <- function(x) {    
    sapply(getNodeSet(out, paste("//ax23:", x, sep=''), namespaces=namespaces),xmlValue)
  }
  df <-  do.call(cbind, laply(toget, as.data.frame(xpathfunc)))
  names(df) <- toget
  df
}