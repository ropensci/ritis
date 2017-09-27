#' Returns the unacceptability reason, if any, for the TSN.
#'
#' @export
#' @inheritParams accepted_names
#' @template tsn
#' @examples \dontrun{
#' unacceptability_reason(tsn = 183671)
#' }
unacceptability_reason <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getUnacceptabilityReasonFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- parse_raw(out)
  if (is.null(x$unacceptReason) || inherits(x$unacceptReason, "logical")) {
    tibble::data_frame()
  } else {
    dr_op(tibble::as_data_frame(x), "class")
  }
}
