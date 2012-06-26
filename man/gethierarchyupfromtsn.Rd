\name{gethierarchyupfromtsn}
\alias{gethierarchyupfromtsn}
\title{Returns the parent of the TSN (i.e. the parent of the current scientific name
 in the taxonomic hierarchy) found by comparing the search key to the ITIS
 TSN field.}
\usage{
  gethierarchyupfromtsn(tsn = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getHierarchyUpFromTSN",
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
  Returns the parent of the TSN (i.e. the parent of the
  current scientific name in the taxonomic hierarchy) found
  by comparing the search key to the ITIS TSN field.
}
\examples{
\dontrun{
gethierarchyupfromtsn(tsn = 36485)
}
}

