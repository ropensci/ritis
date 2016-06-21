#' Get accepted names from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' # TSN accepted - good name
#' accepted_names(208527)
#'
#' # TSN not accepted - input TSN is old name
#' accepted_names(504239)
#'
#' # raw json
#' accepted_names(208527, raw = TRUE)
#' # raw xml
#' accepted_names(208527, wt = "xml", raw = TRUE)
#' }
accepted_names <- function(tsn, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getAcceptedNamesFromTSN", list(tsn = tsn), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(
    wt,
    json = {
      if (inherits(x$acceptedNames, "data.frame")) {
        names(x$acceptedNames) <- tolower(names(x$acceptedNames))
        c(submittedtsn = x$tsn, c(as.list(x$acceptedNames)[c('acceptedname', 'acceptedtsn')]))
      } else {
        as.list(c(submittedtsn = x$tsn, acceptedname = NA, acceptedtsn = NA))
      }
    },
    xml = {
      x_tsn <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:tsn", xml2::xml_ns(x)))
      x_acc_names <- lapply(xml2::xml_children(xml2::as_list(xml2::xml_find_all(x, "//ax21:acceptedNames", xml2::xml_ns(x)))[[1]]), function(z) {
        as.list(setNames(xml2::xml_text(z), xml2::xml_name(z)))
      })
      if (length(x_acc_names) < 2) {
        x_tsn
      } else {
        nmslwr(unlist(c(submittedtsn = x_tsn, x_acc_names[1:2]), FALSE))
      }
    }
  )
}
