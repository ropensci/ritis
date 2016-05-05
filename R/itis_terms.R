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
  x <- itis_GET("getITISTerms", list(srchKey = x), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x, xml = {
      namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
      gg <- xml_find_all(x, "//ax21:itisTerms", namespaces)
      res <- lapply(gg, function(z) {
        sapply(xml2::xml_children(z), xml_ext)
      })
      tmp <- do.call(rbind.fill, lapply(res, function(x) data.frame(x, stringsAsFactors = FALSE)))
      names(tmp) <- tolower(names(tmp))
      row.names(tmp) <- NULL
      if (NROW(tmp) == 1 && names(tmp) == "x") {
        NA
      } else {
        tmp$commonnames <- gsub("true", NA, as.character(tmp$commonnames))
        tmp
      }
    })
}

itistermsfromcommonname <- function(x, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getITISTermsFromCommonName", list(srchKey = x), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x, xml = {
      namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
      gg <- xml_find_all(x, "//ax21:itisTerms", namespaces)
      res <- lapply(gg, function(z) {
        sapply(xml2::xml_children(z), xml_ext)
      })
      tmp <- do.call(rbind.fill, lapply(res, function(x) data.frame(x, stringsAsFactors = FALSE)))
      names(tmp) <- tolower(names(tmp))
      row.names(tmp) <- NULL
      if (NROW(tmp) == 1 && names(tmp) == "x") {
        NA
      } else {
        tmp$commonnames <- gsub("true", NA, as.character(tmp$commonnames))
        tmp
      }
    })
}

itistermsfromscientificname <- function(x, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getITISTermsFromScientificName", list(srchKey = x), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x, xml = {
    namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
    gg <- xml_find_all(x, "//ax21:itisTerms", namespaces)
    res <- lapply(gg, function(z) {
      sapply(xml2::xml_children(z), xml_ext)
    })
    tmp <- do.call(rbind.fill, lapply(res, function(x) data.frame(x,
                                                                  stringsAsFactors = FALSE)))
    names(tmp) <- tolower(names(tmp))
    row.names(tmp) <- NULL
    if (NROW(tmp) == 1 && names(tmp) == "x") {
      NA
    } else {
      tmp
    }
  })
}
