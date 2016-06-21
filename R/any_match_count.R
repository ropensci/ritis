#' Get any match count.
#'
#' @export
#' @template common
#' @param x text or taxonomic serial number (TSN) (character or numeric)
#' @return An integer containing the number of matches the search will return.
#' @examples \dontrun{
#' any_match_count(202385)
#' any_match_count("dolphin")
#' }
any_match_count <- function(x, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getAnyMatchCount", list(srchKey = x), wt = wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x$return, xml = as.numeric(xml2::xml_text(x)))
}
