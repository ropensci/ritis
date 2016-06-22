#' Get credibility rating from tsn
#'
#' @export
#' @name credibility
#' @template common
#' @template tsn
#' @return a data.frame
#' @details methods:
#' \itemize{
#'  \item credibility_rating: Get credibility rating for a tsn
#'  \item credibility_ratings: Get possible credibility ratings
#' }
#' @examples \dontrun{
#' credibility_rating(tsn = 526852)
#' credibility_rating(526852, wt = "xml")
#' credibility_rating(526852, raw = TRUE)
#'
#' credibility_ratings()
#' credibility_ratings(wt = "xml")
#' credibility_ratings(raw = TRUE)
#' credibility_ratings(wt = "json", raw = TRUE)
#' }
credibility_rating <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getCredibilityRatingFromTSN", list(tsn = tsn), wt, ...)
  if (raw || wt == "xml") return(out)
  dr_op(tibble::as_data_frame(parse_raw(out)), "class")
}

#' @export
#' @rdname credibility
credibility_ratings <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getCredibilityRatings", list(), wt, ...)
  if (raw || wt == "xml") return(out)
  dr_op(tibble::as_data_frame(parse_raw(out)), "class")
}
