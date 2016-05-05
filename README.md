ritis
=====

[![Build Status](https://api.travis-ci.org/ropensci/ritis.png)](https://travis-ci.org/ropensci/ritis)


## UPDATE: 2016-03-15

playing with bring this pkg back... now that there's a Solr service

# Installation


```r
devtools::install_github("ropensci/ritis")
```


```r
library("ritis")
```

# Solr service

matches only monomials


```r
itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{0,0}*/")
```

```
## http://services.itis.gov/?q=nameWOInd:/[A-Za-z0-9]*[%20]{0,0}*/&wt=json
```

```
## Source: local data frame [10 x 26]
## 
##      tsn          nameWInd         nameWOInd             unit1   usage
##    (chr)             (chr)             (chr)             (chr)   (chr)
## 1     51     Schizomycetes     Schizomycetes     Schizomycetes invalid
## 2     50          Bacteria          Bacteria          Bacteria   valid
## 3     52     Archangiaceae     Archangiaceae     Archangiaceae invalid
## 4     53   Pseudomonadales   Pseudomonadales   Pseudomonadales   valid
## 5     54 Rhodobacteriineae Rhodobacteriineae Rhodobacteriineae invalid
## 6     55  Pseudomonadineae  Pseudomonadineae  Pseudomonadineae invalid
## 7     56  Nitrobacteraceae  Nitrobacteraceae  Nitrobacteraceae invalid
## 8     57       Nitrobacter       Nitrobacter       Nitrobacter   valid
## 9     65      Nitrosomonas      Nitrosomonas      Nitrosomonas   valid
## 10    70  Thiobacteriaceae  Thiobacteriaceae  Thiobacteriaceae invalid
## Variables not shown: unacceptReason (chr), credibilityRating (chr),
##   completenessRating (chr), currencyRating (chr), kingdom (chr), rankID
##   (chr), rank (chr), hierarchySoFar (chr), hierarchySoFarWRanks (chr),
##   hierarchyTSN (chr), synonyms (chr), synonymTSNs (chr), otherSource
##   (chr), acceptedTSN (chr), comment (chr), createDate (chr), updateDate
##   (chr), _version_ (dbl), taxonAuthor (chr), vernacular (chr), parentTSN
##   (chr)
```

matches only binomials


```r
itis_search(q = "nameWOInd:/[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*/")
```

```
## http://services.itis.gov/?q=nameWOInd:/[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*/&wt=json
```

```
## Source: local data frame [10 x 24]
## 
##      tsn                  nameWInd                 nameWOInd        unit1
##    (chr)                     (chr)                     (chr)        (chr)
## 1     58        Nitrobacter agilis        Nitrobacter agilis  Nitrobacter
## 2     59        Nitrobacter flavus        Nitrobacter flavus  Nitrobacter
## 3     60  Nitrobacter oligotrophis  Nitrobacter oligotrophis  Nitrobacter
## 4     61   Nitrobacter polytrophus   Nitrobacter polytrophus  Nitrobacter
## 5     62      Nitrobacter punctata      Nitrobacter punctata  Nitrobacter
## 6     64  Nitrobacter winogradskyi  Nitrobacter winogradskyi  Nitrobacter
## 7     66     Nitrosomonas europaea     Nitrosomonas europaea Nitrosomonas
## 8     67 Nitrosomonas groningensis Nitrosomonas groningensis Nitrosomonas
## 9     68   Nitrosomonas javenensis   Nitrosomonas javenensis Nitrosomonas
## 10    69    Nitrosomonas monocella    Nitrosomonas monocella Nitrosomonas
## Variables not shown: unit2 (chr), usage (chr), unacceptReason (chr),
##   credibilityRating (chr), kingdom (chr), rankID (chr), rank (chr),
##   hierarchySoFar (chr), hierarchySoFarWRanks (chr), hierarchyTSN (chr),
##   synonyms (chr), synonymTSNs (chr), otherSource (chr), acceptedTSN (chr),
##   comment (chr), createDate (chr), updateDate (chr), _version_ (dbl),
##   taxonAuthor (chr), parentTSN (chr)
```
