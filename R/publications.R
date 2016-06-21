#' Returns a list of the pulications used for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' publications(70340)
#' }
publications <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getPublicationsFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("actualPubDate","isbn","issn","listedPubDate","pages",
                "pubComment","pubName","pubPlace","publisher","referenceAuthor",
                "name","refLanguage","referredTsn","title","updateDate")
  xpathfunc <- function(x) {
    xml2::xml_text(xml2::xml_find_all(out, paste("//ax21:", x, sep = ''), namespaces))
  }
  df <-  do.call(cbind, lapply(toget, function(z) as.data.frame(xpathfunc(z))))
  if (NROW(df) > 0) names(df) <- tolower(toget)
  df
}
