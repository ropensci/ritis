#' Returns a list of the other sources used for the TSN.
#'
#' @export
#' @inheritParams accepted_names
#' @template tsn
#' @examples \dontrun{
#' # results
#' other_sources(tsn=182662)
#' # no results
#' other_sources(tsn=2085272) 
#' # get xml
#' other_sources(tsn=182662, wt = "xml")
#' }
other_sources <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getOtherSourcesFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- parse_raw(out)$otherSources
  if (inherits(x, "logical") || is.null(x)) {
    tibble::tibble()
  } else {
    x <- cbind(dr_op(x, "referencefor"), bindlist(x$referenceFor))
    tibble::as_tibble(pick_cols(
      x,
      c("acquisitiondate","name","referredtsn","source", "sourcetype","updatedate","version")
    ))
  }
}

bindlist <- function(x) {
  (data.table::setDF(data.table::rbindlist(x, use.names = TRUE, fill = TRUE)))
}
