#' Returns a list of the pulications used for the TSN.
#'
#' @export
#' @inheritParams accepted_names
#' @template tsn
#' @return a data.frame
#' @examples \dontrun{
#' publications(tsn = 70340)
#' publications(tsn = 70340, wt = "xml")
#'
#' publications(tsn = 70340, verbose = TRUE)
#' }
publications <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getPublicationsFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- parse_raw(out)$publications
  tibble::as_tibble(pick_cols(
    x,
    c("actualPubDate","isbn","issn","listedPubDate","pages",
      "pubComment","pubName","pubPlace","publisher","referenceAuthor",
      "referredTsn","title","updateDate")
  ))
}
