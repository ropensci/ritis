#' Returns the usage information for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' usage(526852, config=timeout(3))
#' }
usage <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTaxonomicUsageFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("taxonUsageRating","tsn")
  itis_parse(toget, out, namespaces)
}
