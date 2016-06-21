#' Get core metadata from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' # coverage and currrency data
#' core_metadata(tsn=28727)
#' core_metadata(tsn=28727, wt = "xml")
#' # no coverage or currrency data
#' core_metadata(183671)
#' core_metadata(183671, wt = "xml")
#' }
core_metadata <- function(tsn, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getCoreMetadataFromTSN", list(tsn = tsn), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x, xml = {
    namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
    toget <- list("credRating","rankId","taxonCoverage","taxonCurrency","taxonUsageRating","tsn")
    itis_parse(a = toget, b = x, d = namespaces)
  }
  )
}
