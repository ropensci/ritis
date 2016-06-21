#' Get full hierarchy from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' full_hierarchy(tsn=37906)
#' full_hierarchy(tsn=37906, raw = TRUE)
#' full_hierarchy(100800, wt = "xml")
#' }
full_hierarchy <- function(tsn, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getFullHierarchyFromTSN", list(tsn = tsn), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x, xml = {
    namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
    parentName <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:parentName", xml2::xml_ns(x)))
    parentTsn <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:parentTsn", xml2::xml_ns(x)))
    rankName <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:rankName", xml2::xml_ns(x)))
    taxonName <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:taxonName", xml2::xml_ns(x)))
    tsn <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:tsn", xml2::xml_ns(x)))
    nmslwr(data.frame(parentName = parentName, parentTsn = parentTsn,
                      rankName = rankName[-length(rankName)],
                      taxonName = taxonName, tsn = tsn[-1], stringsAsFactors = FALSE))
  })
}
