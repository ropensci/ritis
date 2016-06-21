#' Search by scientific name
#'
#' @export
#' @template common
#' @inheritParams any_match_count
#' @examples \dontrun{
#' search_scientific("Tardigrada", config=timeout(3))
#' search_scientific("Quercus douglasii", config=timeout(3))
#' }
search_scientific <- function(x, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("searchByScientificName", list(srchKey = x), wt, ...)
  namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd")
  matches <- c("combinedName","tsn")
  itisdf(out, namespaces, matches, tolower(matches))
}
