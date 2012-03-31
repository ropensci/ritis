\name{getcommentdetailfromtsn}
\alias{getcommentdetailfromtsn}
\title{Retrieve accepted TSN (with accepted name)}
\usage{
  getcommentdetailfromtsn(tsn = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getCommentDetailFromTSN",
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
  Retrieve accepted TSN (with accepted name)
}
\examples{
\dontrun{
getcommentdetailfromtsn(180543)
}
}

