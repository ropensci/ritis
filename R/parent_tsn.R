#' Returns the parent TSN for the entered TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' parent_tsn(202385, config=timeout(3))
#' }
parent_tsn <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getParentTSNFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("parentTsn","tsn")
  itis_parse(toget, out, namespaces)
}
