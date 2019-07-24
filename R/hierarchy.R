#' Get hierarchy down from tsn
#'
#' @export
#' @name hierarchy
#' @inheritParams accepted_names
#' @template tsn
#' @details Hierarchy methods:
#' \itemize{
#'  \item hierarchy_down: Get hierarchy down from tsn
#'  \item hierarchy_up: Get hierarchy up from tsn
#'  \item hierarchy_full: Get full hierarchy from tsn
#' }
#' @examples \dontrun{
#' ## Full down (class Mammalia)
#' hierarchy_down(tsn=179913)
#'
#' ## Full up (genus Agoseris)
#' hierarchy_up(tsn=36485)
#'
#' ## Full hierarchy
#' ### genus Liatris
#' hierarchy_full(tsn=37906)
#' ### get raw data back
#' hierarchy_full(tsn=37906, raw = TRUE)
#' ### genus Baetis, get xml back
#' hierarchy_full(100800, wt = "xml")
#' }
hierarchy_down <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getHierarchyDownFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  tibble::as_tibble(
    pick_cols(parse_raw(out)$hierarchyList, c("parentName","parentTsn",
                                              "rankName","taxonName","tsn"))
  )
}

#' @export
#' @rdname hierarchy
hierarchy_up <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getHierarchyUpFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  res <- tc(pick_cols(parse_raw(out), c("parentName","parentTsn","rankName",
                                        "taxonName","tsn")))
  tibble::as_tibble(
    if (length(names(res)) != 1) res else NULL
  )
}

#' @export
#' @rdname hierarchy
hierarchy_full <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getFullHierarchyFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- parse_raw(out)
  tibble::as_tibble(
    pick_cols(
      if ('hierarchyList' %in% names(x)) x$hierarchyList else x,
      c('parentname', 'parenttsn', 'rankname', 'taxonname', 'tsn')
    )
  )
}
