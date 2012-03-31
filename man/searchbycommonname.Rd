\name{searchbycommonname}
\alias{searchbycommonname}
\title{Retrieve accepted TSN (with accepted name)}
\usage{
  searchbycommonname(srchkey = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/searchByCommonName",
    ..., curl = getCurlHandle())

  searchbycommonname(srchkey = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/searchByCommonName",
    ..., curl = getCurlHandle())
}
\arguments{
  \item{srchkey}{string with search text (character)}

  \item{url}{the ITIS API url for the function (should be
  left to default)}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{srchkey}{string with search text (character)}

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

  A data.frame with results.
}
\description{
  Retrieve accepted TSN (with accepted name)

  Retrieve accepted TSN (with accepted name)
}
\examples{
\dontrun{
searchbycommonname("american bullfrog")
searchbycommonname("ferret-badger")
}
\dontrun{
searchbycommonname("american bullfrog")
searchbycommonname("ferret-badger")
}
}

