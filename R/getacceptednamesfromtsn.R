#' Retrieve accepted TSN (with accepted name)
#' @import XML RCurl
#' @param tsn TSN for a taxonomic group (numeric)
#' @param supmess suppressMessages or not (defaults to TRUE)
#' @param url the ITIS API url for the function (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return names or TSNs of all downstream taxa.
#' @details you can suppress the message output with suppressMessages()
#' @export
#' @examples \dontrun{
#' getacceptednamesfromtsn('208527')  # TSN accepted - good name
#' getacceptednamesfromtsn(tsn='504239')  # TSN not accepted - input TSN is old name
#' getacceptednamesfromtsn('504239', FALSE)  # TSN not accepted - input TSN is old name
#' }
getacceptednamesfromtsn <- function(tsn = NA, supmess = TRUE,
  url = "http://www.itis.gov/ITISWebService/services/ITISService/getAcceptedNamesFromTSN",
  ...,
  curl = getCurlHandle())
{ 
  args <- list()
  if(!is.na(tsn))
    args$tsn <- tsn
  tt <- getForm(url, 
    .params = args, 
    ...,
    curl = curl)
  tt_ <- xmlParse(tt)
  temp <- xmlToList(tt_)
  if(supmess == FALSE) {
    if(length(temp$return$acceptedNames) == 1) 
      { message("Good name!")
        temp$return$tsn
        } else
      { message("Bad name!")
        c(submittedTsn = temp$return$tsn, temp$return$acceptedNames[1:2])
        }
  } else
      { if(length(temp$return$acceptedNames) == 1) { temp$return$tsn } else
          { c(submittedTsn = temp$return$tsn, temp$return$acceptedNames[1:2]) } }
}