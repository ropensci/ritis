\name{getglobalspeciescompletenessfromtsn}
\alias{getglobalspeciescompletenessfromtsn}
\title{Retruns the taxon completenes rating for the TSN.}
\usage{
  getglobalspeciescompletenessfromtsn(tsn = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getGlobalSpeciesCompletenessFromTSN",
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
  Retruns the taxon completenes rating for the TSN.
}
\examples{
\dontrun{
getglobalspeciescompletenessfromtsn(tsn = 180541)
}
}

