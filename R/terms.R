foo_terms <- function(path) {
  function(x, wt = "json", raw = FALSE, ...) {
    out <- itis_GET(path, list(srchKey = x), wt, ...)
    if (raw || wt == "xml") return(out)
    x <- parse_raw(out)
    if (NROW(x) == 0) return(tibble::tibble())
    if (is.null(x$itisTerms) || inherits(x$itisTerms, "logical")) {
      tibble::tibble()
    } else {
      dr_op(tibble::as_tibble(x$itisTerms), "class")
    }
  }
}
itisterms <- foo_terms("getITISTerms")
itisterms_com <- foo_terms("getITISTermsFromCommonName")
itisterms_sci <- foo_terms("getITISTermsFromScientificName")

#' Get ITIS terms, i.e., tsn's, authors, common names, and scientific names
#'
#' @export
#' @inheritParams accepted_names
#' @param query One or more common or scientific names, or partial names
#' @param what One of both (search common and scientific names), common
#' (search just common names), or scientific (search just scientific names)
#' @examples \dontrun{
#' # Get terms searching both common and scientific names
#' terms(query='bear')
#'
#' # Get terms searching just common names
#' terms(query='tarweed', "common")
#'
#' # Get terms searching just scientific names
#' terms(query='Poa annua', "scientific")
#'
#' # many at once
#' terms(query=c('Poa annua', 'Pinus contorta'), "scientific")
#' }
terms <- function(query, what = "both", wt = "json", raw = FALSE, ...) {
  what <- match.arg(what, c('both', 'scientific', 'common'))
  fun <- switch(what, both = itisterms, common = itisterms_com,
    scientific = itisterms_sci)
  temp <- lapply(query, fun, wt = wt, raw = raw, ...)
  if (length(query) == 1) return(temp[[1]])
  stats::setNames(temp, query)
}
