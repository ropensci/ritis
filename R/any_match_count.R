#' Get any match count.
#'
#' @export
#' @template common
#' @param x text or taxonomic serial number (TSN) (character or numeric)
#' @return An integer containing the number of matches the search will return.
#' @examples \dontrun{
#' any_match_count(x = 202385)
#' any_match_count(x = "dolphin")
#' any_match_count(x = "dolphin", wt = "xml")
#' }
any_match_count <- function(x, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getAnyMatchCount", list(srchKey = x), wt = wt, ...)
  if (raw || wt == "xml") return(out)
  parse_raw(out)$return
}
