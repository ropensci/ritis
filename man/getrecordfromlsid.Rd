\name{getrecordfromlsid}
\alias{getrecordfromlsid}
\title{Gets the partial ITIS record for the TSN in the LSID, found by comparing the
 TSN in the search key to the TSN field. Returns an empty result set if
 there is no match or the TSN is invalid.}
\usage{
  getrecordfromlsid(lsid = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getRecordFromLSID",
    ..., curl = getCurlHandle())
}
\arguments{
  \item{lsid}{lsid for a taxonomic group (numeric)}

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
  Gets the partial ITIS record for the TSN in the LSID,
  found by comparing the TSN in the search key to the TSN
  field. Returns an empty result set if there is no match
  or the TSN is invalid.
}
\examples{
\dontrun{
getrecordfromlsid(lsid = "urn:lsid:itis.gov:itis_tsn:180543")
}
}

