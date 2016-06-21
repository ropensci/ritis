#' Returns the scientific name for the TSN. Also returns the component parts
#'    (names and indicators) of the scientific name.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' scientific_name(531894, config=timeout(3))
#' }
scientific_name <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getScientificNameFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("combinedName","unitInd1","unitInd3","unitName1","unitName2",
                "unitName3","tsn")
  itis_parse(toget, out, namespaces)
}
