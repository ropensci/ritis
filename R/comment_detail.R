#' Get comment detail from TSN
#'
#' @export
#' @template tsn
#' @template common
#' @return A data.frame with results.
#' @examples \dontrun{
#' comment_detail(tsn=180543)
#' comment_detail(tsn=180543, wt = "xml")
#' library(httr)
#' comment_detail(tsn=180543, config=verbose())
#' }
comment_detail <- function(tsn, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getCommentDetailFromTSN", list(tsn = tsn), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x, xml = {
    namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
    matches <- c("commentDetail", "commentId", "commentTimeStamp", "commentator","updateDate")
    colnames <- c('comment','commid','commtime','commentator','updatedate')
    nmslwr(itisdf(a = x, b = namespaces, matches = matches, colnames = colnames))
  }
  )
}
