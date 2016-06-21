#' Provides a list of all the unique rank names contained in the database and
#'  their kingdom and rank ID values.
#'
#' @export
#' @template common
#' @examples \dontrun{
#' rank_names(config=timeout(3))
#' }
rank_names <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getRankNames", list(), wt, ...)
  namespaces <- c(ax23 = "http://metadata.itis_service.itis.usgs.gov/xsd")
  matches <- c("kingdomName","rankId","rankName")
  itisdf(out, namespaces, matches, tolower(matches), "ax23")
}
