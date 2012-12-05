#' Returns a list of the synonyms (if any) for the TSN.
#' 
#' @import XML RCurl
#' @param tsn TSN for a taxonomic group (numeric)
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' getsynonymnamesfromtsn(tsn = 183671) # tsn not accepted
#' getsynonymnamesfromtsn(tsn = 526852) # tsn accepted
#' }
getsynonymnamesfromtsn <- function(tsn = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/getSynonymNamesFromTSN',
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
  namespaces <- c(ax23="http://data.itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax23:name", namespaces=namespaces)
  if( length(sapply(nodes, xmlValue)) == 0){ name <- list("nomatch") } else
    { name <- sapply(nodes, xmlValue) }
  nodes <- getNodeSet(out, "//ax23:tsn", namespaces=namespaces)
  if( length(sapply(nodes, xmlValue)) == 1){ tsn <- sapply(nodes, xmlValue) } else
    { tsn <- sapply(nodes, xmlValue) 
      tsn <- tsn[-length(tsn)]
    } 
  data.frame(name=name[[1]], tsn=tsn)
}