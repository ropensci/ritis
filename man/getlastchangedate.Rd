\name{getlastchangedate}
\alias{getlastchangedate}
\title{Provides the date the ITIS database was last updated.}
\usage{
  getlastchangedate(url = "http://www.itis.gov/ITISWebService/services/ITISService/getLastChangeDate",
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
  Provides the date the ITIS database was last updated.
}
\examples{
\dontrun{
getlastchangedate()
}
}

