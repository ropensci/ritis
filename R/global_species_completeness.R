#' Get global species completeness from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' global_species_completeness(tsn=180541, config=timeout(3))
#' }
global_species_completeness <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getGlobalSpeciesCompletenessFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("completeness","rankId","tsn")
  itis_parse(toget, out, namespaces)
}
