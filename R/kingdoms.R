#' Get kingdom names from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' kingdom_name(202385, config=timeout(3))
#' }
kingdom_name <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getKingdomNameFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("kingdomId","kingdomName","tsn")
  itis_parse(toget, out, namespaces)
}

#' Get all possible kingdom names
#'
#' @export
#' @template common
#' @examples \dontrun{
#' kingdom_names(config=timeout(3))
#' }
kingdom_names <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getKingdomNames", list(), wt, ...)
  namespaces <- c(ax21 = "http://metadata.itis_service.itis.usgs.gov/xsd")
  matches <- c("kingdomId","kingdomName","tsn")
  itisdf(out, namespaces, matches, tolower(matches))
}
