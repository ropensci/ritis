#' ITIS Solr group search
#'
#' @export
#' @param ... Args passed to \code{\link[solrium]{solr_group}}
#' @examples \dontrun{
#' x <- itis_group(q = "nameWOInd:/[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*/",
#'    group.field = 'rank', group.limit = 3)
#' head(x)
#' }
itis_group <- function(...) {
  invisible(solrium::solr_connect(url = itis_solr_url()))
  solrium::solr_group(...)
}
