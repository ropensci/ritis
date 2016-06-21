#' Get coverge from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' # coverage data
#' coverage(tsn=28727)
#' # no coverage data
#' coverage(526852)
#' coverage(526852, wt = "xml")
#' }
coverage <- function(tsn, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getCoverageFromTSN", list(tsn = tsn), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x, xml = {
    namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
    matches <- c("rankId", "taxonCoverage", "tsn")
    itisdf(a = x, b = namespaces, matches, colnames = tolower(matches))
  }
  )
}
