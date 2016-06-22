#' Get ITIS terms, i.e., tsn's, authors, common names, and scientific names.
#'
#' @export
#' @template common
#' @param query One or more common or scientific names, or partial names
#' @param what One of both (search common and scientific names), common (search just
#'    common names), or scientific (search just scientific names)
#' @examples \dontrun{
#' # Get terms searching both common and scientific names
#' itis_terms(query='bear')
#'
#' # Get terms searching just common names
#' itis_terms(query='tarweed', "common")
#'
#' # Get terms searching just scientific names
#' itis_terms(query='Poa annua', "scientific")
#'
#' # many at once
#' itis_terms(query=c('Poa annua', 'Pinus contorta'), "scientific")
#' }
itis_terms <- function(query, what = "both", wt = "json", raw = FALSE, ...) {
  what <- match.arg(what, c('both', 'scientific', 'common'))
  temp <- switch(what,
                 both = lapply(query, function(x) itisterms(x, wt, raw, ...)),
                 common = lapply(query, function(x) itistermsfromcommonname(x, wt, raw, ...)),
                 scientific = lapply(query, function(x) itistermsfromscientificname(x, wt, raw, ...)))
  if (length(query) == 1) {
    temp[[1]]
  } else {
    setNames(temp, query)
  }
}

# helpers
itisterms <- function(x, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getITISTerms", list(srchKey = x), wt, ...)
  if (raw || wt == "xml") return(out)
  tibble::as_data_frame(parse_raw(wt, out)$itisTerms)
}

itistermsfromcommonname <- function(x, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getITISTermsFromCommonName", list(srchKey = x), wt, ...)
  if (raw || wt == "xml") return(out)
  tibble::as_data_frame(parse_raw(wt, out)$itisTerms)
}

itistermsfromscientificname <- function(x, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getITISTermsFromScientificName", list(srchKey = x), wt, ...)
  if (raw || wt == "xml") return(out)
  tibble::as_data_frame(parse_raw(wt, out)$itisTerms)
}
