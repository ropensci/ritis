#' Search by scientific name
#'
#' @export
#' @inheritParams accepted_names
#' @inheritParams any_match_count
#' @return a data.frame
#' @seealso \code{\link{search_common}}
#' @examples \dontrun{
#' search_scientific("Tardigrada")
#' search_scientific("Quercus douglasii")
#' }
search_scientific <- function(x, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("searchByScientificName", list(srchKey = x), wt, ...)
  if (raw || wt == "xml") return(out)
  tibble::as_data_frame(
    dr_op(parse_raw(out)$scientificNames, "class")
  )
}
