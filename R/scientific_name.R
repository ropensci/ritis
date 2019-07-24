#' Returns the scientific name for the TSN. Also returns the component parts
#'    (names and indicators) of the scientific name.
#'
#' @export
#' @inheritParams accepted_names
#' @template tsn
#' @return a data.frame
#' @examples \dontrun{
#' scientific_name(tsn = 531894)
#' }
scientific_name <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getScientificNameFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  x <- tc(parse_raw(out))
  tibble::as_tibble(pick_cols(
    data.frame(x, stringsAsFactors = FALSE),
    c("combinedName","unitInd1","unitInd3","unitName1","unitName2",
      "unitName3","tsn")
  ))
}
