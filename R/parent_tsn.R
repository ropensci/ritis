#' Returns the parent TSN for the entered TSN.
#'
#' @export
#' @inheritParams accepted_names
#' @template tsn
#' @return a data.frame
#' @examples \dontrun{
#' parent_tsn(tsn = 202385)
#' parent_tsn(tsn = 202385, raw = TRUE)
#' parent_tsn(tsn = 202385, wt = "xml")
#' }
parent_tsn <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getParentTSNFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- parse_raw(out)
  res <- tc(pick_cols(x, c("parentTsn", "tsn")))
  tibble::as_tibble(
    if (length(names(res)) == 1) NULL else res
  )
}
