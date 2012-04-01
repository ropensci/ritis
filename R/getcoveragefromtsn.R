#' Returns the taxon coverage information for the TSN. 
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
#' getcoveragefromtsn(tsn = 28727)  # coverage data
#' getcoveragefromtsn(tsn = 526852)  # no coverage data
#' }
getcoveragefromtsn <- function(tsn = NA,
   url = 'http://www.itis.gov/ITISWebService/services/ITISService/getCoverageFromTSN',
   ..., curl = getCurlHandle() ) 
{
  args <- list()
  if(!is.na(tsn))
    args$tsn <- tsn
  tt <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- xmlParse(tt)
  namespaces <- c(ax23="http://data.itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax23:rankId", namespaces=namespaces)
  rankid <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:taxonCoverage", namespaces=namespaces)
  taxoncoverage <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:tsn", namespaces=namespaces)
  tsn <- sapply(nodes, xmlValue)
  data.frame(rankid=rankid, taxoncoverage=taxoncoverage, tsn=tsn)
}