#' ITIS Solr highlight
#'
#' @export
#' @param ... Arguments passed on to the `params` parameter of
#' the [solrium::solr_highlight()] function. See [solr_fields] for possible
#' parameters, and examples below
#' @inheritParams itis_search
#' @examples \dontrun{
#' itis_highlight(q = "rank:Species", hl.fl = 'rank', rows=10)
#' }
itis_highlight <- function(..., proxy = NULL, callopts=list()) {
  if (!is.null(proxy)) conn_dc <- make_itis_conn(proxy)
  args <- list(...)
	if (!is.null(args$fl)) args$fl <- paste(args$fl, collapse = ",")
  conn_itis$highlight(params = args, callopts = callopts)
}
