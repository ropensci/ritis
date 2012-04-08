\name{getparenttsnfromtsn}
\alias{getparenttsnfromtsn}
\title{Returns the parent TSN for the entered TSN.}
\usage{
  getparenttsnfromtsn(tsn = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getParentTSNFromTSN",
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
  Returns the parent TSN for the entered TSN.
}
\examples{
\dontrun{
getparenttsnfromtsn(tsn = 202385)
}
}

