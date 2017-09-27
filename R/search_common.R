#' Search for tsn by common name
#'
#' @export
#' @param x text or taxonomic serial number (TSN) (character or numeric)
#' @param from (character) One of "all", "begin", or "end". See Details.
#' @inheritParams accepted_names
#' @details The `from` parameter:
#' \itemize{
#'  \item all - Search against the `searchByCommonName` API route, which
#'  searches entire name string
#'  \item begin - Search against the `searchByCommonNameBeginsWith` API
#'  route, which searches for a match at the beginning of a name string
#'  \item end - Search against the `searchByCommonNameEndsWith` API route,
#'  which searches for a match at the end of a name string
#' }
#' @return a data.frame
#' @seealso [search_scientific()]
#' @examples \dontrun{
#' search_common("american bullfrog")
#' search_common("ferret-badger")
#' search_common("polar bear")
#'
#' # comparison: all, begin, end
#' search_common("inch")
#' search_common("inch", from = "begin")
#' search_common("inch", from = "end")
#'
#' # end
#' search_common("snake", from = "end")
#' }
search_common <- function(x, from = "all", wt = "json", raw = FALSE,
                          ...) {
  verb <- switch(from,
                 all = "searchByCommonName",
                 begin = "searchByCommonNameBeginsWith",
                 end = "searchByCommonNameEndsWith")
  out <- itis_GET(endpt = verb, args = list(srchKey = x), wt, ...)
  if (raw || wt == "xml") return(out)
  tibble::as_data_frame(dr_op(parse_raw(out)$commonNames, "class"))
}
