\name{getdescription}
\alias{getdescription}
\title{Provides a description of the web service and the ITIS database.}
\usage{
  getdescription(url = "http://www.itis.gov/ITISWebService/services/ITISService/getDescription")
}
\arguments{
  \item{url}{the ITIS API url for the function (should be
  left to default)}
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

