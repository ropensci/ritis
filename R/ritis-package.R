#' Interface to Integrated Taxonomic Information (ITIS)
#'
#' @section ritis package API:
#' All functions that start with \code{itis_} work with the ITIS Solr
#' API described at \url{http://www.itis.gov/solr_documentation.html},
#' which uses the package \pkg{solrium}, and these functions have you
#' use the \pkg{solrium} function interfaces, so you can pass on parameters
#' to the \pkg{solrium} functions - so the \pkg{solrium} docs are important
#' here.
#'
#' All other functions work with the ITIS REST API described at
#' \url{http://www.itis.gov/ws_description.html}. For these methods,
#' they can grab data in either JSON or XML format. JSON is the default.
#' We parse the JSON to R native format, either data.frame, character
#' string, or list. You can get raw JSON as a character string back,
#' or raw XML as a character string, and then parse yourself with
#' \pkg{jsonlite} or \pkg{xml2}
#'
#' @name ritis-package
#' @aliases ritis
#' @docType package
#' @author Scott Chamberlain \email{myrmecocystus@@gmail.com}
NULL
