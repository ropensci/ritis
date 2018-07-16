#' ITIS Solr facet
#'
#' @export
#' @param ... Arguments passed on to the `params` parameter of
#' the [solrium::solr_facet()] function. See [solr_fields] for possible
#' parameters, and examples below
#' @inheritParams itis_search
#' @examples \dontrun{
#' itis_facet(q = "rank:Species", rows = 0, facet.field = "kingdom")$facet_fields
#'
#' x <- itis_facet(q = "hierarchySoFar:*$Aves$* AND rank:Species AND usage:valid",
#'    facet.pivot = "nameWInd,vernacular", facet.limit = -1, facet.mincount = 1,
#'    rows = 0)
#' head(x$facet_pivot$`nameWInd,vernacular`)
#' }
itis_facet <- function(..., proxy = NULL, callopts=list()) {
  if (!is.null(proxy)) conn_dc <- make_itis_conn(proxy)
  args <- list(...)
	if (!is.null(args$fl)) args$fl <- paste(args$fl, collapse = ",")
  conn_itis$facet(params = args, callopts = callopts)
}
