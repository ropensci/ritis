\name{getanymatchcount}
\alias{getanymatchcount}
\title{Retrieve accepted TSN (with accepted name)}
\usage{
  getanymatchcount(srchkey = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getAnyMatchCount",
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
  An integer containing the number of matches the search
  will return.
}
\description{
  Retrieve accepted TSN (with accepted name)
}
\examples{
\dontrun{
getanymatchcount(202385)
getanymatchcount("dolphin")
}
}

