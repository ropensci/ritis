#' ITIS Solr facet
#'
#' @export
#' @param ... Args passed to \code{\link[solrium]{solr_facet}}
#' @examples \dontrun{
#' itis_facet(q = "rank:Species", rows = 0, facet.field = "kingdom")$facet_fields
#'
#' x <- itis_facet(q = "hierarchySoFar:*$Aves$* AND rank:Species AND usage:valid",
#'    facet.pivot = "nameWInd,vernacular", facet.limit = -1, facet.mincount = 1,
#'    rows = 0)
#' head(x$facet_pivot$`nameWInd,vernacular`)
#' }
itis_facet <- function(...) {
  invisible(solrium::solr_connect(url = itis_solr_url()))
  solrium::solr_facet(...)
}
