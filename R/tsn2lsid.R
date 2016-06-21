#' Gets the unique LSID for the TSN, or an empty result if there is no match.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' tsn2lsid(155166)
#' }
tsn2lsid <- function(tsn, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getLSIDFromTSN", list(tsn = tsn), wt, ...)
  xml2::xml_text(xml2::xml_children(x))
}
