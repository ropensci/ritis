#' Search for any matched page
#'
#' @export
#' @template common
#' @inheritParams any_match_count
#' @return a data.frame
#' @param pagesize An integer containing the page size (numeric)
#' @param pagenum An integer containing the page number (numeric)
#' @param ascend A boolean containing true for ascending sort order or false
#'    for descending (logical)
#' @return a data.frame
#' @seealso \code{\link{search_anymatch}}
#' @examples \dontrun{
#' search_any_match_paged(x=202385, pagesize=100, pagenum=1, ascend=FALSE)
#' search_any_match_paged(x="Zy", pagesize=100, pagenum=1, ascend=FALSE)
#' }
search_any_match_paged <- function(x, pagesize = NULL, pagenum = NULL, ascend = NULL, wt = "json", raw = FALSE, ...) {
  args <- tc(list(srchKey=x, pageSize=pagesize, pageNum=pagenum, ascend=ascend))
  out <- itis_GET("searchForAnyMatchPaged", args, wt, ...)
  if (raw || wt == "xml") return(out)
  x <- parse_raw(out)$anyMatchList
  tmp <- dr_op(bindlist(x$commonNameList.commonNames), "class")
  names(tmp) <- paste0("common_", names(tmp))
  x <- suppressWarnings(
    cbind(
      dr_op(x, c("commonNameList.commonNames", "commonNameList.class", "commonNameList.tsn", "class")),
      tmp
    )
  )
  tibble::as_data_frame(x)
}
