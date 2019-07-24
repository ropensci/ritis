#' Get jurisdictional origin from tsn
#'
#' @export
#' @name jurisdiction
#' @inheritParams accepted_names
#' @template tsn
#' @return
#' \itemize{
#'  \item jurisdictional_origin: data.frame
#'  \item jurisdiction_origin_values: data.frame
#'  \item jurisdiction_values: character vector
#' }
#' @details Jurisdiction methods:
#' \itemize{
#'  \item jurisdictional_origin: Get jurisdictional origin from tsn
#'  \item jurisdiction_origin_values: Get jurisdiction origin values
#'  \item jurisdiction_values: Get all possible jurisdiction values
#' }
#' @examples \dontrun{
#' jurisdictional_origin(tsn=180543)
#' jurisdictional_origin(tsn=180543, wt = "xml")
#'
#' jurisdiction_origin_values()
#'
#' jurisdiction_values()
#' }
jurisdictional_origin <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getJurisdictionalOriginFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  z <- parse_raw(out)
  tibble::as_tibble(
    pick_cols(z$jurisdictionalOrigins, c("jurisdictionValue", "origin",
                                         "updateDate"))
  )
}

#' @export
#' @rdname jurisdiction
jurisdiction_origin_values <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getJurisdictionalOriginValues", list(), wt, ...)
  if (raw || wt == "xml") return(out)
  tibble::as_tibble(
    pick_cols(parse_raw(out)$originValues, c("jurisdiction", "origin"))
  )
}

#' @export
#' @rdname jurisdiction
jurisdiction_values <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getJurisdictionValues", list(), wt, ...)
  if (raw || wt == "xml") return(out)
  parse_raw(out)$jurisdictionValues
}
