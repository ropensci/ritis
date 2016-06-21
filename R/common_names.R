#' Get common names from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' common_names(tsn=183833)
#' common_names(tsn=183833, wt = "xml")
#' }
common_names <- function(tsn, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getCommonNamesFromTSN", list(tsn = tsn), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x, xml = {
    namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
    comname <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:commonName", xml2::xml_ns(x)))
    lang <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:language", xml2::xml_ns(x)))
    tsn <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:tsn", xml2::xml_ns(x)))
    data.frame(comname = comname, lang = lang, tsn = tsn[-length(tsn)], stringsAsFactors = FALSE)
  }
  )
}
