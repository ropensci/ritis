#' Get currency from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' # currency data
#' currency(tsn=28727)
#' currency(tsn=28727, wt = "xml")
#' # no currency dat
#' currency(526852)
#' currency(526852, raw = TRUE)
#' }
currency <- function(tsn, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getCurrencyFromTSN", list(tsn = tsn), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x, xml = {
    namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd")
    matches <- c("rankId","taxonCurrency","tsn")
    nmslwr(itisdf(x, namespaces, matches, tolower(matches)))
  })
}
