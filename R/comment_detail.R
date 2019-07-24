#' Get comment detail from TSN
#'
#' @export
#' @template tsn
#' @inheritParams accepted_names
#' @return A data.frame with results.
#' @examples \dontrun{
#' comment_detail(tsn=180543)
#' comment_detail(tsn=180543, wt = "xml")
#' }
comment_detail <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getCommentDetailFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  dr_op(tibble::as_tibble(parse_raw(out)$comments), "class")
}
