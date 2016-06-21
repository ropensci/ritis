#' Search for any match
#'
#' @export
#' @template common
#' @inheritParams any_match_count
#' @examples \dontrun{
#' search_anymatch(x=202385, config=timeout(3))
#' search_anymatch(x="dolphin", config=timeout(3))
#' }
search_anymatch <- function(x, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("searchForAnyMatch", list(srchKey = x), wt, ...)
  ns <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd")

  if (is.character(x)) {
    me <- xml2::xml_find_all(out, "//ax21:anyMatchList", ns)
    comname <- vapply(me, foosam, "", y = 'commonName', ns = ns)
    comname_lang <- vapply(me, foosam, "", y = 'language', ns = ns)
    sciname <- vapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:sciName", ns)), "")
    tsn <- vapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:tsn", ns)), "")
    data.frame(tsn=tsn, sciname=sciname, comname=comname, comname_lang=comname_lang, stringsAsFactors = FALSE)
  } else {
    me <- xml2::xml_find_all(out, "//ax21:commonNames", ns)
    comname <- sapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:commonName", ns)))
    comname_tsn <- sapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:tsn", ns)))
    comname_lang <- sapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:language", ns)))
    data.frame(tsn=comname_tsn, comname=comname, comname_lang=comname_lang, stringsAsFactors = FALSE)
  }
}

foosam <- function(x, y, ns) {
  tt <- xml2::xml_find_one(x, "ax21:commonNameList", ns)
  ttt <- tryCatch(xml2::xml_find_all(tt, "ax21:commonNames", ns), error = function(e) e)
  if (!inherits(ttt, "error")) {
    tttt <- tryCatch(xml2::xml_find_one(ttt, paste0("ax21:", y), ns), error = function(e) e)
    if (!inherits(ttt, "error")) {
      xx <- xml2::xml_text(tttt)
      if (length(xx) > 1) {
        paste0(xx, collapse = ",")
      } else if (length(xx) == 0) {
        ""
      } else {
        xx
      }
    } else {
      ""
    }
  } else {
    ""
  }
}
