#' @title ritis
#' @description Interface to Integrated Taxonomic Information (ITIS)
#'
#' @section ritis package API:
#' All functions that start with `itis_` work with the ITIS Solr
#' API described at <https://www.itis.gov/solr_documentation.html>,
#' which uses the package \pkg{solrium}, and these functions have you
#' use the \pkg{solrium} function interfaces, so you can pass on parameters
#' to the \pkg{solrium} functions - so the \pkg{solrium} docs are important
#' here.
#'
#' All other functions work with the ITIS REST API described at
#' <https://www.itis.gov/ws_description.html>. For these methods,
#' they can grab data in either JSON or XML format. JSON is the default.
#' We parse the JSON to R native format, either data.frame, character
#' string, or list. You can get raw JSON as a character string back,
#' or raw XML as a character string, and then parse yourself with
#' \pkg{jsonlite} or \pkg{xml2}
#' 
#' You'll also be interested in the taxize book 
#' <https://taxize.dev/>
#' 
#' @section Terminology:
#' - "mononomial": a taxonomic name with one part, e.g, _Poa_
#' - "binomial": a taxonomic name with two parts, e.g, _Poa annua_
#' - "trinomial": a taxonomic name with three parts, e.g, _Poa annua annua_
#'
#' @name ritis-package
#' @aliases ritis
#' @docType package
#' @author Scott Chamberlain \email{myrmecocystus@@gmail.com}
NULL

#' List of fields that can be used in [solr] functions
#'
#' Each element in the list has a list of length tree, with:
#' 
#' - field: the field name, this is the name you can use in your 
#' queries
#' - definition: the definition of the field
#' - example: an example value
#'
#' @format A list of length 36
#' @source <https://www.itis.gov/solr_documentation.html>
#' @name solr_fields
#' @docType data
#' @keywords data
NULL
