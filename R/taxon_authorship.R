#' Returns the author information for the TSN.
#'
#' @export
#' @inheritParams accepted_names
#' @template tsn
#' @return a data.frame
#' @examples \dontrun{
#' taxon_authorship(tsn = 183671)
#' }
taxon_authorship <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTaxonAuthorshipFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- parse_raw(out)
  if (is.null(x$authorship) || inherits(x$authorship, "logical")) {
    tibble::data_frame()
  } else {
    dr_op(tibble::as_data_frame(x), "class")
  }
}
