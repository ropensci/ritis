#' Provides a list of the unique languages used in the vernacular table.
#'
#' @export
#' @template common
#' @return a character vector of verncular names
#' @examples \dontrun{
#' vernacular_languages()
#' }
vernacular_languages <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getVernacularLanguages", list(), wt, ...)
  if (raw || wt == "xml") return(out)
  parse_raw(out)$languageNames
}
