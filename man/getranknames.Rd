\name{getranknames}
\alias{getranknames}
\title{Provides a list of all the unique rank names contained in the database and
 their kingdom and rank ID values.}
\usage{
  getranknames(url = "http://www.itis.gov/ITISWebService/services/ITISService/getRankNames")
}
\arguments{
  \item{url}{the ITIS API url for the function (should be
  left to default)}
}
\value{
  A data.frame with results.
}
\description{
  Provides a list of all the unique rank names contained in
  the database and their kingdom and rank ID values.
}
\details{
  Note: Rank ID values are provided for sorting purposes
  only and are not guaranteed to remain the same through
  database updates.
}
\examples{
\dontrun{
getranknames()
}
}

