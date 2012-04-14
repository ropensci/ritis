# ritis #

`ritis` is a wrapper to the Integrated Taxonomic Information Service (ITIS) API.

We aim to have the package [`taxize`](https://github.com/ropensci/taxize_)), which wraps other taxonomic source APIs ([uBio](http://www.ubio.org/), [EOL](http://eol.org/), [Phylomatic](http://www.phylodiversity.net/phylomatic/)), be the main package users would interact with for all things taxonomic. However, if you just want ITIS data, then `ritis` is for you! The `ritis` package is and will be called by `taxize` in various functions.

[ITIS API docs](http://www.itis.gov/ws_description.html)

No API key is needed for `ritis`.

`ritis` is part of the rOpenSci project, visit [ropensci.org](http://ropensci.org) to learn more.

Install using `install_github` within Hadley's [devtools](https://github.com/hadley/devtools) package.

```R
install.packages("devtools")
require(devtools)
install_github("ritis", "ropensci")
require(ritis)
```