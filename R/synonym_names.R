#' Returns a list of the synonyms (if any) for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @return a data.frame
#' @examples \dontrun{
#' synonym_names(tsn=183671) # tsn not accepted
#' synonym_names(tsn=526852) # tsn accepted
#' }
synonym_names <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getSynonymNamesFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  tmp <- parse_raw(out)$synonyms
  if (inherits(tmp, "logical") || is.null(tmp)) {
    tibble::data_frame()
  } else {
    dr_op(tibble::as_data_frame(tmp), "class")
  }
}
