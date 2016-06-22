#' Gets the TSN corresponding to the LSID, or an empty result if there is no match.
#'
#' @export
#' @template common
#' @param lsid (character) lsid for a taxonomic group. Required.
#' @examples \dontrun{
#' lsid2tsn(lsid="urn:lsid:itis.gov:itis_tsn:28726")
#' lsid2tsn(lsid="urn:lsid:itis.gov:itis_tsn:28726", wt = "xml")
#' lsid2tsn("urn:lsid:itis.gov:itis_tsn:0")
#' lsid2tsn("urn:lsid:itis.gov:itis_tsn:0", wt = "xml")
#' }
lsid2tsn <- function(lsid, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTSNFromLSID", list(lsid = lsid), wt, ...)
  if (raw || wt == "xml") return(out)
  parse_raw(wt, out)$return
}
