#' Gets a record from an LSID
#'
#' @export
#' @inheritParams accepted_names
#' @param lsid lsid for a taxonomic group (character). Required.
#' @details Gets the partial ITIS record for the TSN in the LSID, found by comparing the
#'  TSN in the search key to the TSN field. Returns an empty result set if
#'  there is no match or the TSN is invalid.
#' @return a data.frame
#' @examples \dontrun{
#' record(lsid = "urn:lsid:itis.gov:itis_tsn:180543")
#' }
record <- function(lsid, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getRecordFromLSID", list(lsid = lsid), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- tc(parse_raw(out))
  tibble::as_tibble(
    if (length(names(x)) < 2) {
      NULL
    } else {
      pick_cols(
        data.frame(x, stringsAsFactors = FALSE),
        c("authorship","genusPart","infragenericEpithet",
          "infraspecificEpithet","lsid","nameComplete","nomenclaturalCode",
          "rank","rankString","specificEpithet","uninomial","tsn"))
    }
  )
}
