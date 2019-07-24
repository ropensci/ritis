#' Get expert information for the TSN.
#'
#' @export
#' @inheritParams accepted_names
#' @template tsn
#' @examples \dontrun{
#' experts(tsn = 180544)
#' experts(180544, wt = "xml")
#' experts(180544, raw = TRUE)
#' }
experts <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getExpertsFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  dr_op(tibble::as_tibble(parse_raw(out)$experts), "class")
}
