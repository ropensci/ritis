#' Get tsn by vernacular language
#'
#' @export
#' @template common
#' @param language A string containing the language. This is a language string,
#'    not the international language code (character)
#' @examples \dontrun{
#' # tsn_by_vernacular_language("french", config=timeout(3))
#' }
tsn_by_vernacular_language <- function(language, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTsnByVernacularLanguage", list(language = language), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  matches <- c("commonName","language","tsn")
  itisdf(out, namespaces, matches, tolower(matches))
}
