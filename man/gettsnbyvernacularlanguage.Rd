\name{gettsnbyvernacularlanguage}
\alias{gettsnbyvernacularlanguage}
\title{Retrieve accepted TSN (with accepted name)}
\usage{
  gettsnbyvernacularlanguage(language = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getTsnByVernacularLanguage",
    ..., curl = getCurlHandle())

  gettsnbyvernacularlanguage(language = NA,
    url = "http://www.itis.gov/ITISWebService/services/ITISService/getTsnByVernacularLanguage",
    ..., curl = getCurlHandle())
}
\arguments{
  \item{language}{A string containing the language. This is
  a language string, not the international language code
  (character)}

  \item{url}{the ITIS API url for the function (should be
  left to default)}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{language}{A string containing the language. This is
  a language string, not the international language code
  (character)}

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

  A data.frame with results.
}
\description{
  Retrieve accepted TSN (with accepted name)

  Retrieve accepted TSN (with accepted name)
}
\examples{
\dontrun{
gettsnbyvernacularlanguage("french")
}
\dontrun{
gettsnbyvernacularlanguage("french")
}
}

