#' Returns a list of the synonyms (if any) for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' synonym_names(tsn=183671) # tsn not accepted
#' synonym_names(tsn=526852) # tsn accepted
#' }
synonym_names <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getSynonymNamesFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd")
  nodes <- xml2::xml_text(xml2::xml_find_all(out, "//ax21:sciName", namespaces))
  if ( length(nodes) == 0 ) {
    name <- "nomatch"
  } else {
    name <- nodes
  }
  nodes <- xml2::xml_text(xml2::xml_find_all(out, "//ax21:tsn", namespaces))
  if ( length(nodes) == 1 ) {
    tsn <- nodes
  } else {
    tsn <- nodes[-1]
  }
  data.frame(name = name, tsn = tsn, stringsAsFactors = FALSE)
}
