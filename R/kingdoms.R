#' Get kingdom names from tsn
#'
#' @export
#' @name kingdoms
#' @template common
#' @template tsn
#' @details
#' \itemize{
#'  \item kingdom_name: Get kingdom name for a TSN
#'  \item kingdom_names: Get all possible kingdom names
#' }
#' @examples \dontrun{
#' kingdom_name(202385)
#' kingdom_name(202385, wt = "xml")
#' kingdom_names()
#' }
kingdom_name <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getKingdomNameFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  pick_cols(tibble::as_data_frame(parse_raw(out)), c('kingdomid', 'kingdomname', 'tsn'))
}

#' @export
#' @rdname kingdoms
kingdom_names <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getKingdomNames", list(), wt, ...)
  if (raw || wt == "xml") return(out)
  pick_cols(tibble::as_data_frame(parse_raw(out)$kingdomNames), c('kingdomid', 'kingdomname', 'tsn'))
}
