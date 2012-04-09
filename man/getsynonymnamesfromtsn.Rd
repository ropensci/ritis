\name{getsynonymnamesfromtsn}
\alias{getsynonymnamesfromtsn}
\title{Returns a list of the synonyms (if any) for the TSN.}
\usage{
  getsynonymnamesfromtsn(tsn = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getSynonymNamesFromTSN",
    ..., curl = getCurlHandle())
}
\arguments{
  \item{tsn}{TSN for a taxonomic group (numeric)}

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
  Returns a list of the synonyms (if any) for the TSN.
}
\examples{
\dontrun{
getsynonymnamesfromtsn(tsn = 183671) # tsn not accepted
getsynonymnamesfromtsn(tsn = 526852) # tsn accepted
}
}

