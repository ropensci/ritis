#' Returns the author information for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @return a data.frame
#' @examples \dontrun{
#' taxon_authorship(tsn = 183671)
#' }
taxon_authorship <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTaxonAuthorshipFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  dr_op(tibble::as_data_frame(parse_raw(wt, out)), "class")
}
