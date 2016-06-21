#' Get date data from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' date_data(180543)
#' date_data(180543, wt = "xml")
#' date_data(180543, wt = "xml", raw = TRUE)
#' }
date_data <- function(tsn, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getDateDataFromTSN", list(tsn = tsn), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x, xml = {
    namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd")
    matches <- c("initialTimeStamp","updateDate","tsn")
    nmslwr(itisdf(x, namespaces, matches, tolower(matches)))
  })
}
