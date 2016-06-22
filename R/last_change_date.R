#' Provides the date the ITIS database was last updated
#'
#' @export
#' @template common
#' @return character value with a date
#' @examples \dontrun{
#' last_change_date()
#' last_change_date(wt = "xml")
#' }
last_change_date <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getLastChangeDate", list(), wt, ...)
  if (raw || wt == "xml") return(out)
  parse_raw(out)$updateDate
}
