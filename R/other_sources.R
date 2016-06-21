#' Returns a list of the other sources used for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' other_sources(tsn=182662, config=timeout(3))
#' }
other_sources <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getOtherSourcesFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("acquisitionDate","name","referredTsn","source",
                "sourceType","updateDate","version")
  xpathfunc <- function(x) {
    xml2::xml_text(xml2::xml_find_all(out, paste("//ax21:", x, sep = ''), namespaces))
  }
  nmslwr(setNames(do.call(cbind, lapply(toget, function(z) as.data.frame(xpathfunc(z)))), toget))
}
