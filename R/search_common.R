#' Search for tsn by common name
#'
#' @export
#' @template common
#' @param x text or taxonomic serial number (TSN) (character or numeric)
#' @param from (character) One of "all", "begin", or "end". See Details.
#' @details The \code{from} parameter:
#' \itemize{
#'  \item all - Search against the \code{searchByCommonName} API route, which
#'  searches entire name string
#'  \item begin - Search against the \code{searchByCommonNameBeginsWith} API route, which
#'  searches for a match at the beginning of a name string
#'  \item end - Search against the \code{searchByCommonNameEndsWith} API route, which
#'  searches for a match at the end of a name string
#' }
#' @examples \dontrun{
#' search_common("american bullfrog")
#' search_common("ferret-badger")
#' search_common("polar bear")
#'
#' # comparison: all, begin, end
#' search_common("inch")
#' search_common("inch", from = "begin")
#' search_common("inch", from = "end")
#'
#' # end
#' search_common("snake", from = "end")
#' }
search_common <- function(x, from = "all", wt = "xml", raw = FALSE, ...) {
  verb <- switch(from, all = "searchByCommonName", begin = "searchByCommonNameBeginsWith",
                 end = "searchByCommonNameEndsWith")
  scomm(verb, x, wt, ...)
}

scomm <- function(verb, x, wt, ...) {
  out <- itis_GET(verb, list(srchKey = x), wt, ...)
  com_lang_tsn(out)
}

com_lang_tsn <- function(dat) {
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  comname <- xml_text(xml_find_all(dat, "//ax21:commonName", namespaces))
  lang <- xml_text(xml_find_all(dat, "//ax21:language", namespaces))
  tsn <- xml_text(xml_find_all(dat, "//ax21:tsn", namespaces))
  data.frame(comname = comname, lang = lang, tsn = tsn[!nchar(tsn) == 0], stringsAsFactors = FALSE)
}
