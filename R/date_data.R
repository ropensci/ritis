#' Get date data from tsn
#'
#' @export
#' @template tsn
#' @inheritParams accepted_names
#' @examples \dontrun{
#' date_data(tsn = 180543)
#' date_data(180543, wt = "xml")
#' date_data(180543, wt = "json", raw = TRUE)
#' }
date_data <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getDateDataFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  res <- parse_raw(out)
  if (is.null(res$initialTimeStamp)) res$initialTimeStamp <- ""
  if (is.null(res$updateDate)) res$updateDate <- ""
  dr_op(tibble::as_tibble(res), "class")
}
