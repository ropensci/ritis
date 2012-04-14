\name{getkingdomnames}
\alias{getkingdomnames}
\title{Provides a list of all the unique kingdom names contained in the database,
 their kingdom IDs and their TSNs.}
\usage{
  getkingdomnames(url = "http://www.itis.gov/ITISWebService/services/ITISService/getKingdomNames",
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
  Provides a list of all the unique kingdom names contained
  in the database, their kingdom IDs and their TSNs.
}
\details{
  Note: Kingdom ID values are provided for sorting purposes
  only and are not guaranteed to remain the same through
  database updates.
}
\examples{
\dontrun{
getkingdomnames()
}
}

