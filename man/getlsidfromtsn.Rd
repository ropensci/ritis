\name{getlsidfromtsn}
\alias{getlsidfromtsn}
\title{Gets the unique LSID for the TSN, or an empty result if there is no match.}
\usage{
  getlsidfromtsn(tsn = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getLSIDFromTSN",
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
  Gets the unique LSID for the TSN, or an empty result if
  there is no match.
}
\examples{
\dontrun{
getlsidfromtsn(tsn = 155166)
}
}

