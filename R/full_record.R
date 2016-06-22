#' Get full record from TSN or lsid
#'
#' @export
#' @param lsid lsid for a taxonomic group (character)
#' @inheritParams comment_detail
#' @examples \dontrun{
#' # from tsn
#' full_record(tsn = 50423)
#' full_record(tsn = 202385)
#' full_record(tsn = 183833)
#'
#' full_record(tsn = 183833, wt = "xml")
#' full_record(tsn = 183833, raw = TRUE)
#'
#' # from lsid
#' full_record(lsid = "urn:lsid:itis.gov:itis_tsn:180543")
#' full_record(lsid = "urn:lsid:itis.gov:itis_tsn:180543")
#' }
full_record <- function(tsn = NULL, lsid = NULL, wt = "json", raw = FALSE, ...) {
  if (!xor(is.null(tsn), is.null(lsid))) stop("Pass only one of `tsn` or `lsid`", call. = FALSE)
  if (!is.null(tsn)) {
    verb <- "getFullRecordFromTSN"
    args <- list(tsn = tsn)
  } else {
    verb <- "getFullRecordFromLSID"
    args <- list(lsid = lsid)
  }
  out <- itis_GET(verb, args, wt, ...)
  if (raw || wt == "xml") return(out)
  parse_raw(wt, out)
}
