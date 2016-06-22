#' Get comment detail from TSN
#'
#' @export
#' @template tsn
#' @template common
#' @return A data.frame with results.
#' @examples \dontrun{
#' comment_detail(tsn=180543)
#' comment_detail(tsn=180543, wt = "xml")
#' library(httr)
#' comment_detail(tsn=180543)
#' }
comment_detail <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getCommentDetailFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  dr_op(tibble::as_data_frame(parse_raw(wt, out)$comments), "class")
}
