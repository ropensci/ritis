#' Retrieve accepted TSN (with accepted name)
#' @import XML RCurl
#' @param language A string containing the language. This is a language string, 
#'    not the international language code (character)
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @export
#' @examples \dontrun{
#' gettsnbyvernacularlanguage("french")
#' }
gettsnbyvernacularlanguage <- function(language = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/getTsnByVernacularLanguage',
  ..., curl = getCurlHandle() ) 
{
  args <- list()
  if(!is.na(language))
    args$language <- language
  tt <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- xmlParse(tt)
  namespaces <- c(ax23="http://data.itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax23:commonName", namespaces=namespaces)
  comname <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:language", namespaces=namespaces)
  language <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:tsn", namespaces=namespaces)
  tsn <- sapply(nodes, xmlValue)
  data.frame(comname=comname, language=language, tsn=tsn)
}