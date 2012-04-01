\name{getfullrecordfromtsn}
\alias{getfullrecordfromtsn}
\title{Get full record from TSN.}
\usage{
  getfullrecordfromtsn(tsn = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getFullRecordFromTSN",
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
  Returns the full ITIS record for a TSN found by comparing
  the search key to the TSN field, or an empty result set
  if there is no match.
}
\details{
  Note: Because this API must do multiple database lookups,
  this can be a time-comsuming operation and may take
  several seconds to return information.
}
\examples{
\dontrun{
getfullrecordfromtsn(tsn = 183833)
}
}

