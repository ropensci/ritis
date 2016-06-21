#' Search for any matched page
#'
#' @export
#' @template common
#' @inheritParams any_match_count
#' @param pagesize An integer containing the page size (numeric)
#' @param pagenum An integer containing the page number (numeric)
#' @param ascend A boolean containing true for ascending sort order or false
#'    for descending (logical)
#' @examples \dontrun{
#' search_any_match_paged(x=202385, pagesize=100, pagenum=1, ascend=FALSE)
#' search_any_match_paged(x="Zy", pagesize=100, pagenum=1, ascend=FALSE)
#' }
search_any_match_paged <- function(x, pagesize = NULL, pagenum = NULL, ascend = NULL, wt = "json", raw = FALSE, ...) {
  args <- tc(list(srchKey=x, pageSize=pagesize, pageNum=pagenum, ascend=ascend))
  out <- itis_GET("searchForAnyMatchPaged", args, wt, ...)
  ns <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))

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
