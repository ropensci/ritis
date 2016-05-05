% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/itis.R
\name{currency}
\alias{currency}
\title{Get currency from tsn}
\usage{
currency(tsn, wt = "json", raw = FALSE, ...)
}
\arguments{
\item{tsn}{TSN for a taxonomic group (numeric). Required.}

\item{wt}{(character) One of "json" or "xml". Required.}

\item{raw}{(logical) Return raw JSON or XML as character string. Required.
Default: \code{FALSE}}

\item{...}{Curl options passed on to \code{\link[httr]{GET}}}
}
\description{
Get currency from tsn
}
\examples{
\dontrun{
# currency data
currency(tsn=28727)
currency(tsn=28727, wt = "xml")
# no currency dat
currency(526852)
currency(526852, raw = TRUE)
}
}
