\name{getfullhierarchyfromtsn}
\alias{getfullhierarchyfromtsn}
\title{Returns the Taxonomic Hierarchy}
\usage{
  getfullhierarchyfromtsn(tsn = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getFullHierarchyFromTSN",
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
  Returns the Taxonomic Hierarchy (i.e. the hierarchy from
  the kingdom to the requested scientific name) found by
  iteratively comparing the TSN to the Parent TSN field.
}
\examples{
\dontrun{
getfullhierarchyfromtsn(tsn = 37906)
}
}

