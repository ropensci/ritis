\name{getacceptednamesfromtsn}
\alias{getacceptednamesfromtsn}
\title{Retrieve accepted TSN (with accepted name)}
\usage{
  getacceptednamesfromtsn(tsn = NA, supmess = TRUE,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getAcceptedNamesFromTSN",
    ..., curl = getCurlHandle())
}
\arguments{
  \item{tsn}{TSN for a taxonomic group (numeric)}

  \item{supmess}{suppressMessages or not (defaults to
  TRUE)}

  \item{url}{the ITIS API url for the function (should be
  left to default)}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  names or TSNs of all downstream taxa.
}
\description{
  Retrieve accepted TSN (with accepted name)
}
\details{
  you can suppress the message output with
  suppressMessages()
}
\examples{
\dontrun{
getacceptednamesfromtsn('208527')  # TSN accepted - good name
getacceptednamesfromtsn('504239')  # TSN not accepted - input TSN is old name
getacceptednamesfromtsn('504239', FALSE)  # TSN not accepted - input TSN is old name
}
}

