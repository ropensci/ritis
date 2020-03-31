#' Search for any match
#'
#' @export
#' @inheritParams accepted_names
#' @inheritParams any_match_count
#' @return a data.frame
#' @seealso \code{\link{search_any_match_paged}}
#' @examples \dontrun{
#' search_anymatch(x = 202385)
#' search_anymatch(x = "dolphin")
#' # no results
#' search_anymatch(x = "Pisces")
#' }
search_anymatch <- function(x, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("searchForAnyMatch", list(srchKey = x), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- parse_raw(out)$anyMatchList
  tmp <- dr_op(bindlist(x$commonNameList.commonNames), "class")
  if (NROW(tmp) == 0) return(tibble::tibble())
  names(tmp) <- paste0("common_", names(tmp))
  x <- suppressWarnings(
    cbind(
      dr_op(x, c("commonNameList.commonNames", "commonNameList.class",
                 "commonNameList.tsn", "class")),
      tmp
    )
  )
  tibble::as_tibble(x)
}
