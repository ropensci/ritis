#' Gets the partial ITIS record for the TSN in the LSID, found by comparing the
#'  TSN in the search key to the TSN field. Returns an empty result set if
#'  there is no match or the TSN is invalid.
#'
#' @export
#' @template common
#' @param lsid lsid for a taxonomic group (character). Required.
#' @examples \dontrun{
#' record("urn:lsid:itis.gov:itis_tsn:180543", config=timeout(5))
#' }
record <- function(lsid, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getRecordFromLSID", list(lsid = lsid), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("authorship","genusPart","infragenericEpithet",
                "infraspecificEpithet","lsid","nameComplete","nomenclaturalCode",
                "rank","rankString","specificEpithet","uninomial","tsn")
  itis_parse(toget, out, namespaces)
}
