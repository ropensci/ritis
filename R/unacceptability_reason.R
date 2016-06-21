#' Returns the unacceptability reason, if any, for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' unacceptability_reason(183671, config=timeout(3))
#' }
unacceptability_reason <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getUnacceptabilityReasonFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("tsn","unacceptReason")
  itis_parse(toget, out, namespaces)
}
