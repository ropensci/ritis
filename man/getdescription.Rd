\name{getdescription}
\alias{getdescription}
\title{Provides a description of the web service and the ITIS database.}
\usage{
  getdescription(url = "http://www.itis.gov/ITISWebService/services/ITISService/getDescription",
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
  Provides a description of the web service and the ITIS
  database.
}
\examples{
\dontrun{
getdescription()
}
}

