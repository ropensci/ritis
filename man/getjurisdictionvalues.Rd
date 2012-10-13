\name{getjurisdictionvalues}
\alias{getjurisdictionvalues}
\title{Provides a list of all the unique jurisdiction values contained in the database.}
\usage{
  getjurisdictionvalues(url = "http://www.itis.gov/ITISWebService/services/ITISService/getJurisdictionValues")
}
\arguments{
  \item{url}{the ITIS API url for the function (should be
  left to default)}
}
\value{
  A data.frame with results.
}
\description{
  Provides a list of all the unique jurisdiction values
  contained in the database.
}
\examples{
\dontrun{
getjurisdictionvalues()
}
}

