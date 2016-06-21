#' Returns the author information for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' taxon_authorship(183671, config=timeout(3))
#' }
taxon_authorship <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTaxonAuthorshipFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("authorship","updateDate","tsn")
  itis_parse(toget, out, namespaces)
}
