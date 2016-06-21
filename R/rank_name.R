#' Returns the kingdom and rank information for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' rank_name(202385, config=timeout(3))
#' }
rank_name <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTaxonomicRankNameFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("kingdomId","kingdomName","rankId","rankName","tsn")
  itis_parse(toget, out, namespaces)
}
