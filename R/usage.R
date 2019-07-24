#' Returns the usage information for the TSN.
#'
#' @export
#' @inheritParams accepted_names
#' @template tsn
#' @examples \dontrun{
#' usage(tsn = 526852)
#' usage(tsn = 526852, raw = TRUE)
#' usage(tsn = 526852, wt = "xml")
#' }
usage <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTaxonomicUsageFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- parse_raw(out)
  if (is.null(x$taxonUsageRating) || inherits(x$taxonUsageRating, "logical")) {
    tibble::data_frame()
  } else {
    dr_op(tibble::as_tibble(x), "class")
  }
}
