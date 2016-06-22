#' Get global species completeness from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' global_species_completeness(tsn = 180541)
#' global_species_completeness(180541, wt = "xml")
#' global_species_completeness(180541, wt = "json", raw = TRUE)
#' }
global_species_completeness <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getGlobalSpeciesCompletenessFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  tibble::as_data_frame(parse_raw(wt, out)[c("completeness","rankId","tsn")])
}
