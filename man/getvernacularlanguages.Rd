\name{getvernacularlanguages}
\alias{getvernacularlanguages}
\title{Provides a list of the unique languages used in the vernacular table.}
\usage{
  getvernacularlanguages(url = "http://www.itis.gov/ITISWebService/services/ITISService/getVernacularLanguages")
}
\arguments{
  \item{url}{the ITIS API url for the function (should be
  left to default)}
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

