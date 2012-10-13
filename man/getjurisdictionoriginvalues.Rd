\name{getjurisdictionoriginvalues}
\alias{getjurisdictionoriginvalues}
\title{Provides a list of all the unique origin values contained in the database.}
\usage{
  getjurisdictionoriginvalues(url = "http://www.itis.gov/ITISWebService/services/ITISService/getJurisdictionalOriginValues")
}
\arguments{
  \item{url}{the ITIS API url for the function (should be
  left to default)}
}
\value{
  A data.frame with results.
}
\description{
  Provides a list of all the unique origin values contained
  in the database.
}
\examples{
\dontrun{
getjurisdictionoriginvalues()
}
}

