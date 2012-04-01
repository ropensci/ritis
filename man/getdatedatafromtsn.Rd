\name{getdatedatafromtsn}
\alias{getdatedatafromtsn}
\title{Returns the initial time stamp and last update date for the TSN.}
\usage{
  getdatedatafromtsn(tsn = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getDateDataFromTSN",
    ..., curl = getCurlHandle())
}
\arguments{
  \item{tsn}{TSN for a taxonomic group (numeric)}

  \item{url}{the ITIS API url for the function (should be
  left to default)}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  A data.frame with results.
}
\description{
  Returns the initial time stamp and last update date for
  the TSN.
}
\examples{
\dontrun{
getdatedatafromtsn(tsn = 180543)
}
}

