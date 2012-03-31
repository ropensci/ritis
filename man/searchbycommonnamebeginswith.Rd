\name{searchbycommonnamebeginswith}
\alias{searchbycommonnamebeginswith}
\title{Retrieve accepted TSN (with accepted name)}
\usage{
  searchbycommonnamebeginswith(srchkey = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/searchByCommonNameBeginsWith",
    ..., curl = getCurlHandle())

  searchbycommonnamebeginswith(srchkey = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/searchByCommonNameBeginsWith",
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
searchbycommonnamebeginswith("inch")
}
\dontrun{
searchbycommonnamebeginswith("inch")
}
}

