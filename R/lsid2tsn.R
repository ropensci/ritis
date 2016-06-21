#' Gets the TSN corresponding to the LSID, or an empty result if there is no match.
#'
#' @export
#' @template common
#' @param lsid lsid for a taxonomic group (character). Required.
#' @examples \dontrun{
#' lsid2tsn(lsid="urn:lsid:itis.gov:itis_tsn:28726", config=timeout(3))
#' lsid2tsn("urn:lsid:itis.gov:itis_tsn:0", config=timeout(3))
#' }
lsid2tsn <- function(lsid, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTSNFromLSID", list(lsid = lsid), wt, ...)
  tmp <- suppressWarnings(as.numeric(xml2::xml_text(xml2::xml_find_one(out, "ns:return", xml2::xml_ns(out)))))
  if (!is.na(tmp)) {
    tmp
  } else {
    return("invalid TSN")
  }
}
