#' Get tsn by vernacular language
#'
#' @export
#' @template common
#' @param language A string containing the language. This is a language string,
#'    not the international language code (character)
#' @return a data.frame
#' @examples \dontrun{
#' tsn_by_vernacular_language(language = "french")
#' }
tsn_by_vernacular_language <- function(language, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTsnByVernacularLanguage", list(language = language), wt, ...)
  if (raw || wt == "xml") return(out)
  dr_op(tibble::as_data_frame(parse_raw(wt, out)$vernacularTsns), "class")
}
