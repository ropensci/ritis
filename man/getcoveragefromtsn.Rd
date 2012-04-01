\name{getcoveragefromtsn}
\alias{getcoveragefromtsn}
\title{Returns the taxon coverage information for the TSN.}
\usage{
  getcoveragefromtsn(tsn = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getCoverageFromTSN",
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
getcoveragefromtsn(tsn = 28727)  # coverage data
getcoveragefromtsn(tsn = 526852)  # no coverage data
}
}

