\name{gethierarchydownfromtsn}
\alias{gethierarchydownfromtsn}
\title{Returns a list of all the valid/accepted scientific names contained within
 a particular valid/accepted scientific name and their TSNs, limited to
 immediate children only. The result set will be found by comparing the
 search key to the parent TSN field.}
\usage{
  gethierarchydownfromtsn(tsn = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getHierarchyDownFromTSN",
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
  Returns a list of all the valid/accepted scientific names
  contained within a particular valid/accepted scientific
  name and their TSNs, limited to immediate children only.
  The result set will be found by comparing the search key
  to the parent TSN field.
}
\examples{
\dontrun{
gethierarchydownfromtsn(tsn = 161030)
}
}

