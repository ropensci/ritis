#' Returns the unacceptability reason, if any, for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' unacceptability_reason(tsn = 183671)
#' }
unacceptability_reason <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getUnacceptabilityReasonFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  dr_op(tibble::as_data_frame(parse_raw(out)), "class")
}
