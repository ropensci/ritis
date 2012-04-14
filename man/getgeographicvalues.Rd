\name{getgeographicvalues}
\alias{getgeographicvalues}
\title{Provides a list of all the geographic values contained in the database.}
\usage{
  getgeographicvalues(url = "http://www.itis.gov/ITISWebService/services/ITISService/getGeographicValues",
    ..., curl = getCurlHandle())
}
\arguments{
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
  Provides a list of all the geographic values contained in
  the database.
}
\examples{
\dontrun{
getgeographicvalues()
}
}

