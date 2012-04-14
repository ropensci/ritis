\name{getvernacularlanguages}
\alias{getvernacularlanguages}
\title{Provides a list of the unique languages used in the vernacular table.}
\usage{
  getvernacularlanguages(url = "http://www.itis.gov/ITISWebService/services/ITISService/getVernacularLanguages",
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
  Provides a list of the unique languages used in the
  vernacular table.
}
\examples{
\dontrun{
getvernacularlanguages()
}
}

