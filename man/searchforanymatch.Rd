\name{searchforanymatch}
\alias{searchforanymatch}
\title{Retrieve accepted TSN (with accepted name)}
\usage{
  searchforanymatch(srchkey = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/searchForAnyMatch",
    ..., curl = getCurlHandle())
}
\arguments{
  \item{srchkey}{text or taxonomic serial number (TSN)
  (character or numeric)}

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
searchforanymatch(srchkey = 202385)
searchforanymatch(srchkey = "dolphin")
}
}

