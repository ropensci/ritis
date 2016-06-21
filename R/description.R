#' Get description of the ITIS service
#'
#' @export
#' @template common
#' @examples \dontrun{
#' description()
#' }
description <- function(wt = "json", raw = FALSE, ...){
  x <- itis_GET("getDescription", list(), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x$description, xml = xml2::xml_text(xml2::xml_find_all(x, "//ns:return", xml2::xml_ns(x)))[[1]])
}
