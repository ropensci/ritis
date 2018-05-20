ritis
=====



[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![cran checks](https://cranchecks.info/badges/worst/ritis)](https://cranchecks.info/pkgs/ritis)
[![Build Status](https://travis-ci.org/ropensci/ritis.svg?branch=master)](https://travis-ci.org/ropensci/ritis)
[![Build status](https://ci.appveyor.com/api/projects/status/pvrc9muevha00fie/branch/master?svg=true)](https://ci.appveyor.com/project/sckott/ritis/branch/master)
[![codecov](https://codecov.io/gh/ropensci/ritis/branch/master/graph/badge.svg)](https://codecov.io/gh/ropensci/ritis)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/ritis)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/ritis)](https://cran.r-project.org/package=ritis)

* [ITIS API Docs](https://www.itis.gov/ws_description.html)
* [Solr service](https://www.itis.gov/solr_documentation.html)

## Installation

Stable, CRAN version


```r
install.packages("ritis")
```

Dev version


```r
devtools::install_github("ropensci/ritis")
```


```r
library("ritis")
```

## Solr service

matches only monomials


```r
itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{0,0}*/")
#> # A tibble: 10 x 27
#>    tsn   nameWInd  nameWOInd  unit1  usage unacceptReason credibilityRati…
#>    <chr> <chr>     <chr>      <chr>  <chr> <chr>          <chr>           
#>  1 51    Schizomy… Schizomyc… Schiz… inva… unavailable, … Minimum taxonom…
#>  2 50    Bacteria  Bacteria   Bacte… valid <NA>           TWG standards m…
#>  3 52    Archangi… Archangia… Archa… inva… unavailable, … Minimum taxonom…
#>  4 53    Pseudomo… Pseudomon… Pseud… valid <NA>           TWG standards m…
#>  5 54    Rhodobac… Rhodobact… Rhodo… inva… unavailable, … Minimum taxonom…
#>  6 55    Pseudomo… Pseudomon… Pseud… inva… unavailable, … Minimum taxonom…
#>  7 56    Nitrobac… Nitrobact… Nitro… inva… unavailable, … Minimum taxonom…
#>  8 57    Nitrobac… Nitrobact… Nitro… valid <NA>           TWG standards m…
#>  9 65    Nitrosom… Nitrosomo… Nitro… valid <NA>           TWG standards m…
#> 10 70    Thiobact… Thiobacte… Thiob… inva… unavailable, … Minimum taxonom…
#> # ... with 20 more variables: completenessRating <chr>,
#> #   currencyRating <chr>, kingdom <chr>, rankID <chr>, rank <chr>,
#> #   hierarchySoFar <chr>, hierarchySoFarWRanks <chr>, hierarchyTSN <chr>,
#> #   synonyms <chr>, synonymTSNs <chr>, otherSource <chr>,
#> #   acceptedTSN <chr>, comment <chr>, createDate <chr>, updateDate <chr>,
#> #   `_version_` <dbl>, taxonAuthor <chr>, vernacular <chr>,
#> #   hierarchicalSort <chr>, parentTSN <chr>
```

matches only binomials


```r
itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*/")
#> # A tibble: 10 x 25
#>    tsn   nameWInd     nameWOInd     unit1   unit2  usage unacceptReason   
#>    <chr> <chr>        <chr>         <chr>   <chr>  <chr> <chr>            
#>  1 58    Nitrobacter… Nitrobacter … Nitrob… agilis inva… unavailable, dat…
#>  2 59    Nitrobacter… Nitrobacter … Nitrob… flavus inva… unavailable, dat…
#>  3 60    Nitrobacter… Nitrobacter … Nitrob… oligo… inva… unavailable, dat…
#>  4 61    Nitrobacter… Nitrobacter … Nitrob… polyt… inva… unavailable, dat…
#>  5 62    Nitrobacter… Nitrobacter … Nitrob… punct… inva… unavailable, dat…
#>  6 64    Nitrobacter… Nitrobacter … Nitrob… winog… valid <NA>             
#>  7 66    Nitrosomona… Nitrosomonas… Nitros… europ… valid <NA>             
#>  8 67    Nitrosomona… Nitrosomonas… Nitros… groni… inva… unavailable, dat…
#>  9 68    Nitrosomona… Nitrosomonas… Nitros… javen… inva… unavailable, dat…
#> 10 69    Nitrosomona… Nitrosomonas… Nitros… monoc… inva… unavailable, dat…
#> # ... with 18 more variables: credibilityRating <chr>, kingdom <chr>,
#> #   rankID <chr>, rank <chr>, hierarchySoFar <chr>,
#> #   hierarchySoFarWRanks <chr>, hierarchyTSN <chr>, synonyms <chr>,
#> #   synonymTSNs <chr>, otherSource <chr>, acceptedTSN <chr>,
#> #   comment <chr>, createDate <chr>, updateDate <chr>, `_version_` <dbl>,
#> #   taxonAuthor <chr>, parentTSN <chr>, hierarchicalSort <chr>
```

## REST API

Get accepted names for a TSN


```r
accepted_names(tsn = 504239)
#> # A tibble: 1 x 3
#>   acceptedName        acceptedTsn author    
#>   <chr>               <chr>       <chr>     
#> 1 Dasiphora fruticosa 836659      (L.) Rydb.
```

Get common names for a TSN


```r
common_names(tsn = 183833)
#> # A tibble: 3 x 3
#>   commonName          language tsn   
#>   <chr>               <chr>    <chr> 
#> 1 African hunting dog English  183833
#> 2 African Wild Dog    English  183833
#> 3 Painted Hunting Dog English  183833
```

Full hierarchy for a TSN


```r
hierarchy_full(tsn = 37906)
#> # A tibble: 60 x 5
#>    parentname      parenttsn rankname      taxonname       tsn   
#>  * <chr>           <chr>     <chr>         <chr>           <chr> 
#>  1 ""              ""        Kingdom       Plantae         202422
#>  2 Plantae         202422    Subkingdom    Viridiplantae   954898
#>  3 Viridiplantae   954898    Infrakingdom  Streptophyta    846494
#>  4 Streptophyta    846494    Superdivision Embryophyta     954900
#>  5 Embryophyta     954900    Division      Tracheophyta    846496
#>  6 Tracheophyta    846496    Subdivision   Spermatophytina 846504
#>  7 Spermatophytina 846504    Class         Magnoliopsida   18063 
#>  8 Magnoliopsida   18063     Superorder    Asteranae       846535
#>  9 Asteranae       846535    Order         Asterales       35419 
#> 10 Asterales       35419     Family        Asteraceae      35420 
#> # ... with 50 more rows
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/ritis/issues).
* License: MIT
* Get citation information for `ritis` in R doing `citation(package = 'ritis')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ropensci_footer](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
