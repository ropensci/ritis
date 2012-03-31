# ritis #

`ritis` is a wrapper to the Integrated Taxonomic Information Service (ITIS) API.

For most purposes you probably want to use the package taxize (here: https://github.com/SChamberlain/taxize_) which wraps other taxonomic source APIs (uBio, EOL, Phylomatic). The `ritis` package will be called by `taxize` in various functions

[ITIS API docs](http://www.itis.gov/ws_description.html)

`ritis` is part of the rOpenSci project, visit [ropensci.org](http://ropensci.org) to learn more.

Install using `install_github` within Hadley's [devtools](https://github.com/hadley/devtools) package.

```R
install.packages("devtools")
require(devtools)
install_github("ritis", "ropensci")
require(ritis)
```