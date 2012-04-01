\name{getcoremetadatafromtsn}
\alias{getcoremetadatafromtsn}
\title{Retrieve core metadata from TSN.}
\usage{
  getcoremetadatafromtsn(tsn = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getCoreMetadataFromTSN",
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
  This contains credibility rating, taxonomic usage,
  unacceptability reason, coverage, and currency data.
}
\examples{
\dontrun{
getcoremetadatafromtsn(tsn = 28727)  # coverage and currrency data
getcoremetadatafromtsn(tsn = 183671)  # no coverage or currrency data
}
}

