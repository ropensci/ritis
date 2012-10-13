\name{getlastchangedate}
\alias{getlastchangedate}
\title{Provides the date the ITIS database was last updated.}
\usage{
  getlastchangedate(url = "http://www.itis.gov/ITISWebService/services/ITISService/getLastChangeDate")
}
\arguments{
  \item{url}{the ITIS API url for the function (should be
  left to default)}
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

