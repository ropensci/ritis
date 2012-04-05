\name{getitistermsfromscientificname}
\alias{getitistermsfromscientificname}
\title{Retrieve accepted TSN (with accepted name)}
\usage{
  getitistermsfromscientificname(srchkey = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getITISTermsFromScientificName",
    ..., curl = getCurlHandle())
}
\arguments{
  \item{srchkey}{search text of scientific name
  (character)}

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
  Retrieve accepted TSN (with accepted name)
}
\examples{
\dontrun{
getitistermsfromscientificname(srchkey = "ursidae")
}
}

