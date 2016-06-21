#' Get expert information for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' experts(180544)
#' experts(180544, wt = "xml")
#' }
experts <- function(tsn, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getExpertsFromTSN", list(tsn = tsn), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x, xml = {
    namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
    toget <- list("comment","expert","name","referredTsn","referenceFor","updateDate")
    xpathfunc <- function(z) {
      xml2::xml_text(xml2::xml_find_all(x, paste0("//ax21:", z), namespaces))
    }
    nmslwr(setNames(do.call(cbind, lapply(toget, function(z) as.data.frame(xpathfunc(z)))), toget))
  })
}
