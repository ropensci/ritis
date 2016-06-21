#' Get hierarchy down from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' hierarchy_down(tsn=161030, config=timeout(3))
#' }
hierarchy_down <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getHierarchyDownFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  matches <- paste0("hierarchyList/ax21:",
                    c("parentName","parentTsn","rankName","taxonName","tsn"))
  df <- itisdf(out, namespaces, matches, tolower(c("parentName","parentTsn","rankName","taxonName","tsn")))
  df$rankname <- tolower(df$rankname)
  df
}

#' Get hierarchy up from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' hierarchy_up(tsn=36485, config=timeout(3))
#' }
hierarchy_up <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getHierarchyUpFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  matches <- c("parentName","parentTsn","rankName","taxonName","tsn")
  itisdf(out, namespaces, matches, tolower(matches))
}

