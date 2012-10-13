#' Gets the TSN corresponding to the LSID, or an empty result if there is no match.
#' 
#' @import XML RCurl
#' @param lsid lsid for a taxonomic group (numeric)
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' gettsnfromlsid(lsid = "urn:lsid:itis.gov:itis_tsn:28726")
#' gettsnfromlsid(lsid = "urn:lsid:itis.gov:itis_tsn:0")
#' }
gettsnfromlsid <- function(lsid = NA,
   url = 'http://www.itis.gov/ITISWebService/services/ITISService/getTSNFromLSID',
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
  out <- xmlParse(tt)
  if( !is.na( suppressWarnings(as.numeric(xmlToList(out)[[1]])) ) )
    { suppressWarnings( as.numeric(xmlToList(out)[[1]]) )} else
      {"invalid TSN"}
}
