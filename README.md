ritis
=====



[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![cran checks](https://cranchecks.info/badges/worst/ritis)](https://cranchecks.info/pkgs/ritis)
[![R-check](https://github.com/ropensci/ritis/workflows/R-check/badge.svg)](https://github.com/ropensci/ritis/actions?query=workflow%3AR-check)
[![codecov](https://codecov.io/gh/ropensci/ritis/branch/master/graph/badge.svg)](https://codecov.io/gh/ropensci/ritis)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/ritis)](https://github.com/r-hub/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/ritis)](https://cran.r-project.org/package=ritis)

An interface to the Integrated Taxonomic Information System (ITIS)

* ITIS API Docs: <https://www.itis.gov/ws_description.html>
* Solr service: <https://www.itis.gov/solr_documentation.html>
* taxize book: <https://taxize.dev/>
* ritis docs: <https://docs.ropensci.org/ritis/>

How to cite ITIS. From <https://itis.gov/citation.html>

To cite data obtained from ITIS, the following citation format is offered as a suggestion:

    Retrieved [month, day, year], from the Integrated Taxonomic Information System on-line database, http://www.itis.gov.


ITIS is one of many different taxonomic data sources. Other include: Catalogue of Life (and COL+), NCBI taxonomy, International Plant Names Index, Index Fungorum, and more. The Wikipedia entry (<https://en.wikipedia.org/wiki/Integrated_Taxonomic_Information_System>) states that ITIS has a North American focus, but includes many taxa not in North America.

## Terminology

* "mononomial": a taxonomic name with one part, e.g, _Poa_
* "binomial": a taxonomic name with two parts, e.g, _Poa annua_
* "trinomial": a taxonomic name with three parts, e.g, _Poa annua annua_

## Installation

Stable, CRAN version


```r
install.packages("ritis")
```

Dev version


```r
remotes::install_github("ropensci/ritis")
```


```r
library("ritis")
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/ritis/issues).
* License: MIT
* Get citation information for `ritis` in R doing `citation(package = 'ritis')`
* Please note that this package is released with a [Contributor Code of Conduct](https://ropensci.org/code-of-conduct/). By contributing to this project, you agree to abide by its terms.
