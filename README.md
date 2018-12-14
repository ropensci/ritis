ritis
=====



[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![cran checks](https://cranchecks.info/badges/worst/ritis)](https://cranchecks.info/pkgs/ritis)
[![Build Status](https://travis-ci.org/ropensci/ritis.svg?branch=master)](https://travis-ci.org/ropensci/ritis)
[![Build status](https://ci.appveyor.com/api/projects/status/pvrc9muevha00fie/branch/master?svg=true)](https://ci.appveyor.com/project/sckott/ritis/branch/master)
[![codecov](https://codecov.io/gh/ropensci/ritis/branch/master/graph/badge.svg)](https://codecov.io/gh/ropensci/ritis)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/ritis)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/ritis)](https://cran.r-project.org/package=ritis)

An interface to the Integrated Taxonomic Information System (ITIS)

* [ITIS API Docs](https://www.itis.gov/ws_description.html)
* [Solr service](https://www.itis.gov/solr_documentation.html)
* [taxize book](https://ropensci.github.io/taxize-book/)

## Package API

 - `accepted_names`
 - `any_match_count`
 - `comment_detail`
 - `common_names`
 - `core_metadata`
 - `coverage`
 - `credibility_rating`
 - `credibility_ratings`
 - `currency`
 - `date_data`
 - `description`
 - `experts`
 - `full_record`
 - `geographic_divisions`
 - `geographic_values`
 - `global_species_completeness`
 - `hierarchy_down`
 - `hierarchy_full`
 - `hierarchy_up`
 - `itis_facet`
 - `itis_group`
 - `itis_highlight`
 - `itis_search`
 - `jurisdiction_origin_values`
 - `jurisdiction_values`
 - `jurisdictional_origin`
 - `kingdom_name`
 - `kingdom_names`
 - `last_change_date`
 - `lsid2tsn`
 - `other_sources`
 - `parent_tsn`
 - `publications`
 - `rank_name`
 - `rank_names`
 - `record`
 - `review_year`
 - `scientific_name`
 - `search_any_match_paged`
 - `search_anymatch`
 - `search_common`
 - `search_scientific`
 - `synonym_names`
 - `taxon_authorship`
 - `terms`
 - `tsn_by_vernacular_language`
 - `tsn2lsid`
 - `unacceptability_reason`
 - `usage`
 - `vernacular_languages`


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

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/ritis/issues).
* License: MIT
* Get citation information for `ritis` in R doing `citation(package = 'ritis')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ropensci_footer](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
