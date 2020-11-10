ritis
=====



[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![cran checks](https://cranchecks.info/badges/worst/ritis)](https://cranchecks.info/pkgs/ritis)
[![Build Status](https://travis-ci.org/ropensci/ritis.svg?branch=master)](https://travis-ci.org/ropensci/ritis)
[![Build status](https://ci.appveyor.com/api/projects/status/pvrc9muevha00fie/branch/master?svg=true)](https://ci.appveyor.com/project/sckott/ritis/branch/master)
[![codecov](https://codecov.io/gh/ropensci/ritis/branch/master/graph/badge.svg)](https://codecov.io/gh/ropensci/ritis)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/ritis)](https://github.com/metacran/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/ritis)](https://cran.r-project.org/package=ritis)

An interface to the Integrated Taxonomic Information System (ITIS)

* ITIS API Docs: https://www.itis.gov/ws_description.html
* Solr service: https://www.itis.gov/solr_documentation.html
* taxize book: https://taxize.dev/
* ritis docs: https://docs.ropensci.org/ritis/

How to cite ITIS. From https://itis.gov/citation.html 

To cite data obtained from ITIS, the following citation format is offered as a suggestion:

    Retrieved [month, day, year], from the Integrated Taxonomic Information System on-line database, http://www.itis.gov.


ITIS is one of many different taxonomic data sources. Other include: Catalogue of Life (and COL+), NCBI taxonomy, International Plant Names Index, Index Fungorum, and more. The Wikipedia entry (https://en.wikipedia.org/wiki/Integrated_Taxonomic_Information_System) states that ITIS has a North American focus, but includes many taxa not in North America.

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

The following are examples of some functions. There are many more avaiable.

## Solr service


matches only monomials


```r
itis_search(q = "nameWOInd:/[A-Za-z0-9]*[ ]{0,0}*/")
#> # A tibble: 10 x 20
#>    tsn   nameWInd nameWOInd unit1 usage credibilityRati… completenessRat…
#>    <chr> <chr>    <chr>     <chr> <chr> <chr>            <chr>           
#>  1 1400… Leucozo… Leucozona Leuc… valid No review; untr… unknown         
#>  2 1401… Melangy… Melangyna Mela… valid No review; untr… unknown         
#>  3 1401… Melisca… Meliscae… Meli… valid No review; untr… unknown         
#>  4 1401… Ocyptam… Ocyptamus Ocyp… valid No review; untr… unknown         
#>  5 1401… Parasyr… Parasyrp… Para… valid No review; untr… unknown         
#>  6 1402… Pseudod… Pseudodo… Pseu… valid No review; untr… unknown         
#>  7 1402… Salping… Salpingo… Salp… valid No review; untr… unknown         
#>  8 1402… Scaeva   Scaeva    Scae… valid No review; untr… unknown         
#>  9 1402… Sphaero… Sphaerop… Spha… valid No review; untr… unknown         
#> 10 1402… Syrphus  Syrphus   Syrp… valid No review; untr… unknown         
#> # … with 13 more variables: currencyRating <chr>, kingdom <chr>,
#> #   parentTSN <chr>, rankID <chr>, rank <chr>, hierarchySoFar <chr>,
#> #   hierarchySoFarWRanks <chr>, hierarchyTSN <chr>, otherSource <chr>,
#> #   createDate <chr>, updateDate <chr>, hierarchicalSort <chr>,
#> #   `_version_` <dbl>
```

matches only binomials


```r
itis_search(q = "nameWOInd:/[A-Za-z0-9]*[ ]{1,1}[A-Za-z0-9]*/")
#> # A tibble: 10 x 24
#>    tsn   nameWInd nameWOInd unit1 unit2 usage unacceptReason credibilityRati…
#>    <chr> <chr>    <chr>     <chr> <chr> <chr> <chr>          <chr>           
#>  1 1400… Syrphus… Syrphus … Syrp… mont… inva… junior synonym No review; untr…
#>  2 1400… Eupeode… Eupeodes… Eupe… neop… valid <NA>           No review; untr…
#>  3 1400… Syrphus… Syrphus … Syrp… neop… inva… junior synonym No review; untr…
#>  4 1400… Eupeode… Eupeodes… Eupe… nigr… valid <NA>           No review; untr…
#>  5 1400… Metasyr… Metasyrp… Meta… nigr… inva… junior synonym No review; untr…
#>  6 1400… Eupeode… Eupeodes… Eupe… perp… valid <NA>           No review; untr…
#>  7 1400… Syrphus… Syrphus … Syrp… mead… inva… junior synonym No review; untr…
#>  8 1400… Syrphus… Syrphus … Syrp… perp… inva… junior synonym No review; untr…
#>  9 1400… Eupeode… Eupeodes… Eupe… ping… valid <NA>           No review; untr…
#> 10 1400… Syrphus… Syrphus … Syrp… ping… inva… junior synonym No review; untr…
#> # … with 16 more variables: taxonAuthor <chr>, kingdom <chr>, rankID <chr>,
#> #   rank <chr>, hierarchySoFar <chr>, hierarchySoFarWRanks <chr>,
#> #   hierarchyTSN <chr>, synonyms <chr>, synonymTSNs <chr>, otherSource <chr>,
#> #   acceptedTSN <chr>, createDate <chr>, updateDate <chr>, `_version_` <dbl>,
#> #   parentTSN <chr>, hierarchicalSort <chr>
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
#>    parentname        parenttsn rankname      taxonname       tsn   
#>    <chr>             <chr>     <chr>         <chr>           <chr> 
#>  1 ""                ""        Kingdom       Plantae         202422
#>  2 "Plantae"         "202422"  Subkingdom    Viridiplantae   954898
#>  3 "Viridiplantae"   "954898"  Infrakingdom  Streptophyta    846494
#>  4 "Streptophyta"    "846494"  Superdivision Embryophyta     954900
#>  5 "Embryophyta"     "954900"  Division      Tracheophyta    846496
#>  6 "Tracheophyta"    "846496"  Subdivision   Spermatophytina 846504
#>  7 "Spermatophytina" "846504"  Class         Magnoliopsida   18063 
#>  8 "Magnoliopsida"   "18063"   Superorder    Asteranae       846535
#>  9 "Asteranae"       "846535"  Order         Asterales       35419 
#> 10 "Asterales"       "35419"   Family        Asteraceae      35420 
#> # … with 50 more rows
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/ritis/issues).
* License: MIT
* Get citation information for `ritis` in R doing `citation(package = 'ritis')`
* Please note that this package is released with a [Contributor Code of Conduct](https://ropensci.org/code-of-conduct/). By contributing to this project, you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
