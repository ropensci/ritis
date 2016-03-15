#' ITIS Solr search
#'
#' @export
#' @param ... Args passed to \code{\link[solrium]{solr_search}}
#' @examples \dontrun{
#' itis_search(q = "tsn:182662")
#'
#' itis_search(q = "nameWOInd:Liquidamber\\%20styraciflua~0.4")
#' # matches only monomials
#' itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{0,0}*/")
#' # matches only binomials
#' itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*/")
#' # matches only trinomials
#' itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*/")
#' # matches binomials or trinomials
#' itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*[%20]{0,1}[A-Za-z0-9]*/")
#'
#' itis_search(q = "nameWOInd:Poa\\%20annua")
#'
#' itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{0,0}*/", rows = 2)
#' itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{0,0}*/", rows = 200)
#'
#' itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{0,0}*/",
#'    fl = c('nameWInd', 'tsn'))
#' }
itis_search <- function(...) {
  invisible(solrium::solr_connect(url = "http://services.itis.gov"))
  solrium::solr_search(...)
}
