#' Get jurisdictional origin from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' jurisdictional_origin(tsn=180543)
#' }
jurisdictional_origin <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getJurisdictionalOriginFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("jurisdictionValue","origin","updateDate")
  xpathfunc <- function(x) {
    xml2::xml_text(xml2::xml_find_all(out, paste("//ax21:", x, sep = ''), namespaces))
  }
  df <- do.call(cbind, lapply(toget, function(z) as.data.frame(xpathfunc(z))))
  if (NROW(df) == 0) {
    data.frame(jurisdictionvalue = NA, origin = NA, updatedate = NA, stringsAsFactors = FALSE)
  } else {
    setNames(df, tolower(toget))
  }
}

#' Get jurisdiction origin values
#'
#' @export
#' @template common
#' @examples \dontrun{
#' jurisdiction_origin_values(config=timeout(3))
#' }
jurisdiction_origin_values <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getJurisdictionalOriginValues", list(), wt, ...)
  namespaces <- c(ax23 = "http://metadata.itis_service.itis.usgs.gov/xsd")
  matches <- c("jurisdiction","origin")
  itisdf(a = out, b = namespaces, matches = matches, colnames = tolower(matches), pastens = "ax23")
}

#' Get possible jurisdiction values
#'
#' @export
#' @template common
#' @examples \dontrun{
#' jurisdiction_values(config=timeout(3))
#' }
jurisdiction_values <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getJurisdictionValues", list(), wt, ...)
  namespaces <- c(ax23 = "http://metadata.itis_service.itis.usgs.gov/xsd")
  jurisdictionValues <- xml2::xml_text(xml2::xml_find_all(out, "//ax23:jurisdictionValues", namespaces))
  data.frame(jurisdictionvalues = jurisdictionValues, stringsAsFactors = FALSE)
}
