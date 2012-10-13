\name{getgeographicvalues}
\alias{getgeographicvalues}
\title{Provides a list of all the geographic values contained in the database.}
\usage{
  getgeographicvalues(url = "http://www.itis.gov/ITISWebService/services/ITISService/getGeographicValues")
}
\arguments{
  \item{url}{the ITIS API url for the function (should be
  left to default)}
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

