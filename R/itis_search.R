#' ITIS Solr search
#'
#' @export
#' @param ... Arguments passed on to the `params` parameter of
#' the [solrium::solr_search()] function. See [solr_fields] for possible
#' parameters, and examples below
#' @param proxy List of arguments for a proxy connection,
#' including one or more of: url, port, username, password,
#' and auth. See [crul::proxy()] for  help, which is used to
#' construct the proxy connection.
#' @param callopts Curl options passed on to [crul::HttpClient]
#' @references <https://www.itis.gov/solr_documentation.html>
#' @details
#' The syntax for this function can be a bit hard to grasp. See
#' https://itis.gov/solr_examples.html for help on generating the
#' syntax ITIS wants for specific searches.
#' @examples \dontrun{
#' itis_search(q = "tsn:182662")
#' 
#' # get all orders within class Aves (birds)
#' z <- itis_search(q = "rank:Class AND nameWOInd:Aves")
#' hierarchy_down(z$tsn)
#' 
#' # get taxa "downstream" from a target taxon
#' ## taxize and taxizedb packages have downstream() fxns, but
#' ## you can do a similar thing here by iteratively drilling down
#' ## the taxonomic hierarchy
#' ## here, we get families within Aves
#' library(data.table)
#' aves <- itis_search(q = "rank:Class AND nameWOInd:Aves")
#' aves_orders <- hierarchy_down(aves$tsn)
#' aves_families <- lapply(aves_orders$tsn, hierarchy_down)
#' rbindlist(aves_families)
#'
#' # the tila operator
#' itis_search(q = "nameWOInd:Liquidamber\\ styraciflua~0.4")
#' 
#' # matches only monomials
#' itis_search(q = "nameWOInd:/[A-Za-z0-9]*[ ]{0,0}*/")
#' 
#' # matches only binomials
#' itis_search(q = "nameWOInd:/[A-Za-z0-9]*[ ]{1,1}[A-Za-z0-9]*/")
#' 
#' # matches only trinomials
#' itis_search(q = "nameWOInd:/[A-Za-z0-9]*[ ]{1,1}[A-Za-z0-9]*[ ]{1,1}[A-Za-z0-9]*/")
#' 
#' # matches binomials or trinomials
#' itis_search(q = "nameWOInd:/[A-Za-z0-9]*[ ]{1,1}[A-Za-z0-9]*[ ]{0,1}[A-Za-z0-9]*/")
#'
#' itis_search(q = "nameWOInd:Poa\\ annua")
#'
#' # pagination
#' itis_search(q = "nameWOInd:/[A-Za-z0-9]*[ ]{0,0}*/", rows = 2)
#' itis_search(q = "nameWOInd:/[A-Za-z0-9]*[ ]{0,0}*/", rows = 200)
#'
#' # select fields to return
#' itis_search(q = "nameWOInd:/[A-Za-z0-9]*[ ]{0,0}*/",
#'    fl = c('nameWInd', 'tsn'))
#' }
itis_search <- function(..., proxy = NULL, callopts=list()) {
  if (!is.null(proxy)) conn_dc <- make_itis_conn(proxy)
  args <- list(...)
	if (!is.null(args$fl)) args$fl <- paste(args$fl, collapse = ",")
  conn_itis$search(params = args, minOptimizedRows = FALSE,
  	callopts = callopts)
}
