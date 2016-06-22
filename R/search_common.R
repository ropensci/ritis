#' Search for tsn by common name
#'
#' @export
#' @template common
#' @param x text or taxonomic serial number (TSN) (character or numeric)
#' @param from (character) One of "all", "begin", or "end". See Details.
#' @details The \code{from} parameter:
#' \itemize{
#'  \item all - Search against the \code{searchByCommonName} API route, which
#'  searches entire name string
#'  \item begin - Search against the \code{searchByCommonNameBeginsWith} API route, which
#'  searches for a match at the beginning of a name string
#'  \item end - Search against the \code{searchByCommonNameEndsWith} API route, which
#'  searches for a match at the end of a name string
#' }
#' @return a data.frame
#' @seealso \code{\link{search_scientific}}
#' @examples \dontrun{
#' search_common(x = "american bullfrog")
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
search_common <- function(x, from = "all", wt = "json", raw = FALSE, ...) {
  verb <- switch(from, all = "searchByCommonName", begin = "searchByCommonNameBeginsWith",
                 end = "searchByCommonNameEndsWith")
  out <- itis_GET(verb, list(srchKey = x), wt, ...)
  if (raw || wt == "xml") return(out)
  tibble::as_data_frame(dr_op(parse_raw(wt, out)$commonNames, "class"))
}
