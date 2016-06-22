#' Gets the unique LSID for the TSN, or an empty result if there is no match.
#'
#' @export
#' @template common
#' @template tsn
#' @return a character string, an LSID, or \code{NULL} if nothing found
#' @examples \dontrun{
#' tsn2lsid(tsn = 155166)
#' tsn2lsid(tsn = 333333333)
#' tsn2lsid(155166, raw = TRUE)
#' tsn2lsid(155166, wt = "xml")
#' }
tsn2lsid <- function(tsn, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getLSIDFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(x)
  parse_raw(wt, x)$return
}
