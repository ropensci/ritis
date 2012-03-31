\name{searchforanymatchpaged}
\alias{searchforanymatchpaged}
\title{Retrieve accepted TSN (with accepted name)}
\usage{
  searchforanymatchpaged(srchkey = NA, pagesize = NA,
    pagenum = NA, ascend = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/searchForAnyMatchPaged",
    ..., curl = getCurlHandle())

  searchforanymatchpaged(srchkey = NA, pagesize = NA,
    pagenum = NA, ascend = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/searchForAnyMatchPaged",
    ..., curl = getCurlHandle())
}
\arguments{
  \item{srchkey}{text or taxonomic serial number (TSN)
  (character or numeric)}

  \item{pagesize}{An integer containing the page size
  (numeric)}

  \item{pagenum}{An integer containing the page number
  (numeric)}

  \item{ascend}{A boolean containing true for ascending
  sort order or false for descending (logical)}

  \item{url}{the ITIS API url for the function (should be
  left to default)}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{srchkey}{text or taxonomic serial number (TSN)
  (character or numeric)}

  \item{pagesize}{An integer containing the page size
  (numeric)}

  \item{pagenum}{An integer containing the page number
  (numeric)}

  \item{ascend}{A boolean containing true for ascending
  sort order or false for descending (logical)}

  \item{url}{the ITIS API url for the function (should be
  left to default)}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  List of output elements.

  List of output elements.
}
\description{
  Retrieve accepted TSN (with accepted name)

  Retrieve accepted TSN (with accepted name)
}
\examples{
\dontrun{
searchforanymatchpaged(202385, 100, 1, FALSE)
}
\dontrun{
searchforanymatchpaged(202385, 100, 1, FALSE)
}
}

