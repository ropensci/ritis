<!--
%\VignetteEngine{knitr::knitr}
%\VignetteIndexEntry{ritis introduction}
%\VignetteEncoding{UTF-8}
-->



ritis introduction
==================

An interface to the Integrated Taxonomic Information System (ITIS)

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
#>    tsn   name… name… unit1 usage unac… cred… comp… curr… king… rank… rank 
#>    <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>
#>  1 51    Schi… Schi… Schi… inva… unav… Mini… unkn… unkn… Bact… 60    Class
#>  2 50    Bact… Bact… Bact… valid <NA>  TWG … part… 2012  Bact… 10    King…
#>  3 52    Arch… Arch… Arch… inva… unav… Mini… unkn… unkn… Bact… 140   Fami…
#>  4 53    Pseu… Pseu… Pseu… valid <NA>  TWG … comp… 2012  Bact… 100   Order
#>  5 54    Rhod… Rhod… Rhod… inva… unav… Mini… unkn… unkn… Bact… 110   Subo…
#>  6 55    Pseu… Pseu… Pseu… inva… unav… Mini… unkn… unkn… Bact… 110   Subo…
#>  7 56    Nitr… Nitr… Nitr… inva… unav… Mini… unkn… unkn… Bact… 140   Fami…
#>  8 57    Nitr… Nitr… Nitr… valid <NA>  TWG … comp… 2012  Bact… 180   Genus
#>  9 65    Nitr… Nitr… Nitr… valid <NA>  TWG … comp… 2012  Bact… 180   Genus
#> 10 70    Thio… Thio… Thio… inva… unav… Mini… unkn… unkn… Bact… 140   Fami…
#> # ... with 15 more variables: hierarchySoFar <chr>, hierarchySoFarWRanks
#> #   <chr>, hierarchyTSN <chr>, synonyms <chr>, synonymTSNs <chr>,
#> #   otherSource <chr>, acceptedTSN <chr>, comment <chr>, createDate <chr>,
#> #   updateDate <chr>, `_version_` <dbl>, taxonAuthor <chr>, vernacular
#> #   <chr>, hierarchicalSort <chr>, parentTSN <chr>
```

matches only binomials


```r
itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*/")
#> # A tibble: 10 x 25
#>    tsn   name… name… unit1 unit2 usage unac… cred… king… rank… rank  hier…
#>    <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>
#>  1 58    Nitr… Nitr… Nitr… agil… inva… unav… Mini… Bact… 220   Spec… 50:$…
#>  2 59    Nitr… Nitr… Nitr… flav… inva… unav… Mini… Bact… 220   Spec… 50:$…
#>  3 60    Nitr… Nitr… Nitr… olig… inva… unav… Mini… Bact… 220   Spec… 50:$…
#>  4 61    Nitr… Nitr… Nitr… poly… inva… unav… Mini… Bact… 220   Spec… 50:$…
#>  5 62    Nitr… Nitr… Nitr… punc… inva… unav… Mini… Bact… 220   Spec… 50:$…
#>  6 64    Nitr… Nitr… Nitr… wino… valid <NA>  TWG … Bact… 220   Spec… 64:$…
#>  7 66    Nitr… Nitr… Nitr… euro… valid <NA>  TWG … Bact… 220   Spec… 66:$…
#>  8 67    Nitr… Nitr… Nitr… gron… inva… unav… Mini… Bact… 220   Spec… 50:$…
#>  9 68    Nitr… Nitr… Nitr… jave… inva… unav… Mini… Bact… 220   Spec… 50:$…
#> 10 69    Nitr… Nitr… Nitr… mono… inva… unav… Mini… Bact… 220   Spec… 50:$…
#> # ... with 13 more variables: hierarchySoFarWRanks <chr>, hierarchyTSN
#> #   <chr>, synonyms <chr>, synonymTSNs <chr>, otherSource <chr>,
#> #   acceptedTSN <chr>, comment <chr>, createDate <chr>, updateDate <chr>,
#> #   `_version_` <dbl>, taxonAuthor <chr>, parentTSN <chr>,
#> #   hierarchicalSort <chr>
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
