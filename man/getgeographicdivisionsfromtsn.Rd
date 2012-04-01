\name{getgeographicdivisionsfromtsn}
\alias{getgeographicdivisionsfromtsn}
\title{Returns a list of the geographic divisions for the TSN.}
\usage{
  getgeographicdivisionsfromtsn(tsn = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getGeographicDivisionsFromTSN",
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
  Returns a list of the geographic divisions for the TSN.
}
\details{
  Note: Because this API must do multiple database lookups,
  this can be a time-comsuming operation and may take
  several seconds to return information.
}
\examples{
\dontrun{
getgeographicdivisionsfromtsn(tsn = 180543)
}
}

