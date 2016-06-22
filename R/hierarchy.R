#' Get hierarchy down from tsn
#'
#' @export
#' @name hierarchy
#' @template common
#' @template tsn
#' @details Hierarchy methods:
#' \itemize{
#'  \item hierarchy_down: Get hierarchy down from tsn
#'  \item hierarchy_up: Get hierarchy up from tsn
#'  \item hierarchy_full: Get full hierarchy from tsn
#' }
#' @examples \dontrun{
#' ## Full down
#' hierarchy_down(tsn=161030)
#'
#' ## Full up
#' hierarchy_up(tsn=36485)
#'
#' ## Full hierarchy
#' hierarchy_full(tsn=37906)
#' hierarchy_full(tsn=37906, raw = TRUE)
#' hierarchy_full(100800, wt = "xml")
#' }
hierarchy_down <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getHierarchyDownFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  tibble::as_data_frame(
    pick_cols(parse_raw(wt, out)$hierarchyList, c("parentName","parentTsn","rankName","taxonName","tsn"))
  )
}

#' @export
#' @rdname hierarchy
hierarchy_up <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getHierarchyUpFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  tibble::as_data_frame(
    parse_raw(wt, out)[c("parentName","parentTsn","rankName","taxonName","tsn")]
  )
}

#' @export
#' @rdname hierarchy
hierarchy_full <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getFullHierarchyFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- parse_raw(wt, out)
  tibble::as_data_frame(
    pick_cols(x$hierarchyList, c('parentname', 'parenttsn', 'rankname', 'taxonname', 'tsn'))
  )
}
