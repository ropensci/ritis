#' Returns the review year for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' review_year(180541, config=timeout(3))
#' }
review_year <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getReviewYearFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("rankId","reviewYear","tsn")
  itis_parse(toget, out, namespaces)
}

