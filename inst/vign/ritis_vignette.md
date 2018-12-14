<!--
%\VignetteEngine{knitr::knitr}
%\VignetteIndexEntry{ritis introduction}
%\VignetteEncoding{UTF-8}
-->



ritis introduction
==================

An interface to the Integrated Taxonomic Information System (ITIS)

See also the [taxize book](https://ropensci.github.io/taxize-book/) for 
a manual on working with taxonomic data in R, including with ITIS data.

## Installation

Install from CRAN


```r
install.packages("ritis")
```

Or install the development version from GitHub


```r
devtools::install_github("ropensci/ritis")
```

Load `ritis`


```r
library("ritis")
```

## ITIS Solr interface

There are four methods.

* `itis_search()` - Search
* `itis_group()` - Group
* `itis_highlight()` - Hightlight
* `itis_facet()` - Facet

These four methods use the equivalent functions in the package `solrium`, e.g.,
`ritis::itis_search()` uses `solrium::solr_search()`, etc. The `itis_*()` functions
simply use `...` to allow users to pass on parameters to the wrapped `solrium`
functions. So do read the `solrium` docs.

ITIS Solr API docs: <https://www.itis.gov/solr_documentation.html>

Some examples:

matches only monomials


```r
itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{0,0}*/")
#> # A tibble: 10 x 27
#>    tsn   nameWInd nameWOInd unit1 usage unacceptReason credibilityRati…
#>    <chr> <chr>    <chr>     <chr> <chr> <chr>          <chr>           
#>  1 51    Schizom… Schizomy… Schi… inva… unavailable, … Minimum taxonom…
#>  2 50    Bacteria Bacteria  Bact… valid <NA>           TWG standards m…
#>  3 52    Archang… Archangi… Arch… inva… unavailable, … Minimum taxonom…
#>  4 53    Pseudom… Pseudomo… Pseu… valid <NA>           TWG standards m…
#>  5 54    Rhodoba… Rhodobac… Rhod… inva… unavailable, … Minimum taxonom…
#>  6 55    Pseudom… Pseudomo… Pseu… inva… unavailable, … Minimum taxonom…
#>  7 56    Nitroba… Nitrobac… Nitr… inva… unavailable, … Minimum taxonom…
#>  8 57    Nitroba… Nitrobac… Nitr… valid <NA>           TWG standards m…
#>  9 65    Nitroso… Nitrosom… Nitr… valid <NA>           TWG standards m…
#> 10 70    Thiobac… Thiobact… Thio… inva… unavailable, … Minimum taxonom…
#> # … with 20 more variables: completenessRating <chr>,
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
#>    tsn   nameWInd nameWOInd unit1 unit2 usage unacceptReason
#>    <chr> <chr>    <chr>     <chr> <chr> <chr> <chr>         
#>  1 58    Nitroba… Nitrobac… Nitr… agil… inva… unavailable, …
#>  2 59    Nitroba… Nitrobac… Nitr… flav… inva… unavailable, …
#>  3 60    Nitroba… Nitrobac… Nitr… olig… inva… unavailable, …
#>  4 61    Nitroba… Nitrobac… Nitr… poly… inva… unavailable, …
#>  5 62    Nitroba… Nitrobac… Nitr… punc… inva… unavailable, …
#>  6 64    Nitroba… Nitrobac… Nitr… wino… valid <NA>          
#>  7 66    Nitroso… Nitrosom… Nitr… euro… valid <NA>          
#>  8 67    Nitroso… Nitrosom… Nitr… gron… inva… unavailable, …
#>  9 68    Nitroso… Nitrosom… Nitr… jave… inva… unavailable, …
#> 10 69    Nitroso… Nitrosom… Nitr… mono… inva… unavailable, …
#> # … with 18 more variables: credibilityRating <chr>, kingdom <chr>,
#> #   rankID <chr>, rank <chr>, hierarchySoFar <chr>,
#> #   hierarchySoFarWRanks <chr>, hierarchyTSN <chr>, synonyms <chr>,
#> #   synonymTSNs <chr>, otherSource <chr>, acceptedTSN <chr>,
#> #   comment <chr>, createDate <chr>, updateDate <chr>, `_version_` <dbl>,
#> #   taxonAuthor <chr>, parentTSN <chr>, hierarchicalSort <chr>
```

## ITIS REST API interface

ITIS REST API docs: <http://www.itis.gov/ws_description.html>

The following are some example uses. There are many more methods not shown below

-------

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
#>    <chr>           <chr>     <chr>         <chr>           <chr> 
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
#> # … with 50 more rows
```
