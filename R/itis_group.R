#' ITIS Solr group search
#'
#' @export
#' @param ... Arguments passed on to the `params` parameter of
#' the [solrium::solr_group()] function
#' @inheritParams itis_search
#' @examples \dontrun{
#' x <- itis_group(q = "nameWOInd:/[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*/",
#'    group.field = 'rank', group.limit = 3)
#' head(x)
#' }
itis_group <- function(..., proxy = NULL, callopts=list()) {

  if (!is.null(proxy)) conn_dc <- make_itis_conn(proxy)
  args <- list(...)
	if (!is.null(args$fl)) args$fl <- paste(args$fl, collapse = ",")
  conn_itis$group(params = args, callopts = callopts)
}
