# getAcceptedNamesFromTSN.R

getAcceptedNamesFromTSN <- 
# Retrieve accepted TSN (with accepted name)
# Args: 
#     searchtsn: TSN for a taxonomic group (numeric)
# Output: names or TSNs of all downstream taxa
# Note: you can suppress the message output with suppressMessages()
# Examples:
#   getAcceptedNamesFromTSN('208527')  # TSN accepted - good name
#   getAcceptedNamesFromTSN('504239')  # TSN not accepted - input TSN is old name
#   getAcceptedNamesFromTSN('504239', FALSE)  # TSN not accepted - input TSN is old name

function(tsn = NA, supmess = TRUE,
  url = "http://www.itis.gov/ITISWebService/services/ITISService/getAcceptedNamesFromTSN?tsn=",
  ...,
  curl = getCurlHandle())
{
    
    newurl <- paste(url, tsn, sep = '')
    tt <- getURLContent(newurl, curl=curl)  
    tt_ <- xmlParse(tt)
    temp <- xmlToList(tt_)
    if(supmess == FALSE) {
      if(length(temp$return$acceptedNames) == 1) 
        { message("Good name!")
          temp$return$tsn 
          } else
        { message("Bad name!")
          temp$return$acceptedNames[1:2] 
          }
    } else
        { if(length(temp$return$acceptedNames) == 1) { temp$return$tsn } else
            { temp$return$acceptedNames[1:2] } }
}