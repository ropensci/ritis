\name{getcredibilityratings}
\alias{getcredibilityratings}
\title{Provides a list of all the unique valid credibility rating values contained
		in the database.}
\usage{
  getcredibilityratings(url = "http://www.itis.gov/ITISWebService/services/ITISService/getCredibilityRatings")
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
  Provides a list of all the unique valid credibility
  rating values contained in the database.
}
\examples{
\dontrun{
getcredibilityratings()
}
}

