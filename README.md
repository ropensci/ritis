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

* [ITIS API Docs](https://www.itis.gov/ws_description.html)
* [Solr service](https://www.itis.gov/solr_documentation.html)
* [taxize book](https://taxize.dev/)

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
itis_search(q = "nameWOInd:/[A-Za-z0-9]*[ ]{0,0}*/")
#> # A tibble: 10 x 20
#>    tsn   nameWInd nameWOInd unit1 usage credibilityRati… completenessRat…
#>    <chr> <chr>    <chr>     <chr> <chr> <chr>            <chr>           
#>  1 1348… Phthiri… Phthirii… Phth… valid No review; untr… unknown         
#>  2 1348… Phthiria Phthiria  Phth… valid No review; untr… unknown         
#>  3 1348… Poecilo… Poecilog… Poec… valid No review; untr… unknown         
#>  4 1348… Neacreo… Neacreot… Neac… valid No review; untr… unknown         
#>  5 1348… Geronin… Geroninae Gero… valid No review; untr… unknown         
#>  6 1348… Geron    Geron     Geron valid No review; untr… unknown         
#>  7 1349… Cythere… Cytherei… Cyth… valid No review; untr… unknown         
#>  8 1349… Pantarb… Pantarbes Pant… valid No review; untr… unknown         
#>  9 1349… Tomomyz… Tomomyzi… Tomo… valid No review; untr… unknown         
#> 10 1349… Amphico… Amphicos… Amph… valid No review; untr… unknown         
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
#>    tsn   nameWInd nameWOInd unit1 unit2 usage unacceptReason
#>    <chr> <chr>    <chr>     <chr> <chr> <chr> <chr>         
#>  1 1347… Rhabdop… Rhabdops… Rhab… mus   inva… junior synonym
#>  2 1347… Apolysi… Apolysis… Apol… neut… valid <NA>          
#>  3 1347… Pseudog… Pseudoge… Pseu… neut… inva… junior synonym
#>  4 1347… Apolysi… Apolysis… Apol… nigr… valid <NA>          
#>  5 1347… Oligodr… Oligodra… Olig… nigr… inva… junior synonym
#>  6 1347… Apolysi… Apolysis… Apol… obsc… valid <NA>          
#>  7 1347… Pseudog… Pseudoge… Pseu… obsc… inva… junior synonym
#>  8 1347… Apolysi… Apolysis… Apol… palp… valid <NA>          
#>  9 1347… Oligodr… Oligodra… Olig… palp… inva… junior synonym
#> 10 1347… Apolysi… Apolysis… Apol… pann… valid <NA>          
#> # … with 17 more variables: credibilityRating <chr>, taxonAuthor <chr>,
#> #   kingdom <chr>, rankID <chr>, rank <chr>, hierarchySoFar <chr>,
#> #   hierarchySoFarWRanks <chr>, hierarchyTSN <chr>, synonyms <chr>,
#> #   synonymTSNs <chr>, otherSource <chr>, acceptedTSN <chr>,
#> #   createDate <chr>, updateDate <chr>, `_version_` <dbl>,
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
* Please note that this project is released with a [Contributor Code of Conduct][coc].
By participating in this project you agree to abide by its terms.

[![ropensci_footer](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)

[coc]: https://github.com/ropensci/ritis/blob/master/CODE_OF_CONDUCT.md
