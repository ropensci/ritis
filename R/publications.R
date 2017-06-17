#' Returns a list of the pulications used for the TSN.
#'
#' @export
#' @template common
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
  x <- cbind(dr_op(x, "referencefor"), dr_op(bindlist(x$referenceFor), "class"))
  tibble::as_data_frame(pick_cols(
    x,
    c("actualPubDate","isbn","issn","listedPubDate","pages",
      "pubComment","pubName","pubPlace","publisher","referenceAuthor",
      "name","refLanguage","referredTsn","title","updateDate")
  ))
}
