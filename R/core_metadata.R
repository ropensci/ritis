#' Get core metadata from tsn
#'
#' @export
#' @template tsn
#' @inheritParams accepted_names
#' @examples \dontrun{
#' # coverage and currrency data
#' core_metadata(tsn=28727)
#' core_metadata(tsn=28727, wt = "xml")
#' # no coverage or currrency data
#' core_metadata(183671)
#' core_metadata(183671, wt = "xml")
#' }
core_metadata <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getCoreMetadataFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  dr_op(tibble::as_tibble(parse_raw(out)), "class")
}
