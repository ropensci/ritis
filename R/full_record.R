#' Get full record from TSN or lsid
#'
#' @export
#' @param lsid lsid for a taxonomic group (character)
#' @inheritParams comment_detail
#' @examples \dontrun{
#' # from tsn
#' full_record(50423)
#' full_record(202385)
#' full_record(183833)
#'
#' # from lsid
#' full_record(lsid="urn:lsid:itis.gov:itis_tsn:180543")
#' full_record(lsid="urn:lsid:itis.gov:itis_tsn:180543")
#' }
full_record <- function(tsn = NULL, lsid = NULL, wt = "xml", raw = FALSE, ...) {
  if (!xor(is.null(tsn), is.null(lsid))) stop("Pass only one of `tsn` or `lsid`", call. = FALSE)
  if (!is.null(tsn)) {
    verb <- "getFullRecordFromTSN"
    args <- list(tsn = tsn)
  } else {
    verb <- "getFullRecordFromLSID"
    args <- list(lsid = lsid)
  }
  out <- itis_GET(verb, args, wt, ...)
  switch(
    wt,
    json = out,
    xml = {
      namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd")
      toget <- c("acceptedNameList","commentList","commonNameList","completenessRating",
                 "coreMetadata","credibilityRating","currencyRating","dateData","expertList",
                 "geographicDivisionList","hierarchyUp","jurisdictionalOriginList",
                 "kingdom","otherSourceList","parentTSN","publicationList","scientificName",
                 "synonymList","taxRank","taxonAuthor","unacceptReason","usage")
      nmslwr(setNames(lapply(toget, parse_fulldat, dat = out), toget))
    }
  )
}

xml_ext <- function(x) {
  as.list(setNames(xml_text(x), xml_name(x)))
}

parse_fulldat <- function(x, dat) {
  tmp <- xml_children(xml_find_all(dat, sprintf("//ax21:%s", x), xml_ns(dat)))
  tmp <- sapply(tmp, xml_ext)
  if (!is.null(tmp)) nmslwr(tmp) else tmp
}
