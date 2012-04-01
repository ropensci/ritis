\name{getcurrencyfromtsn}
\alias{getcurrencyfromtsn}
\title{Returns the taxon currency information for the TSN.}
\usage{
  getcurrencyfromtsn(tsn = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getCurrencyFromTSN",
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
  This information is available for Genus and above
  (rank_id > 190) only.
}
\examples{
\dontrun{
getcurrencyfromtsn(tsn = 28727) # currency data
getcurrencyfromtsn(tsn = 526852) # no currency dat
}
}

