#' Get credibility rating from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' credibility_rating(526852)
#' credibility_rating(526852, wt = "xml")
#' credibility_rating(526852, wt = "xml", raw = TRUE)
#' credibility_rating(526852, raw = TRUE)
#' }
credibility_rating <- function(tsn, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getCredibilityRatingFromTSN", list(tsn = tsn), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x, xml = {
    namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
    matches <- c("credRating", "tsn")
    itisdf(x, namespaces, matches, tolower(matches))
  }
  )
}

#' Get possible credibility ratings
#'
#' @export
#' @template common
#' @examples \dontrun{
#' credibility_ratings()
#' credibility_ratings(wt = "xml")
#' credibility_ratings(raw = TRUE)
#' credibility_ratings(wt = "xml", raw = TRUE)
#' }
credibility_ratings <- function(wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getCredibilityRatings", list(), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x, xml = {
    namespaces <- c(ax23 = "http://metadata.itis_service.itis.usgs.gov/xsd")
    xx <- xml2::xml_text(xml2::xml_find_all(x, "//ax23:credibilityValues", xml2::xml_ns(x)))
    data.frame(credibilityvalues = xx, stringsAsFactors = FALSE)
  })
}
