## Test environments
* local OS X install, R 3.3.1
* ubuntu 12.04 (on travis-ci), R 3.3.1
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release. I have read and agree to the the CRAN 
policies at http://cran.r-project.org/web/packages/policies.html

## Reverse dependencies

This is a new release, so there are no reverse dependencies.

---

This is a resubmission of a package I previously had on CRAN, but is now
archived. https://cran.rstudio.com/src/contrib/Archive/ritis/ 
Last version on CRAN was v0.0.3

The reason for the re-submission is the data provider, the Integrated 
Taxonomic Information System (ITIS), came out with a new JSON version 
of their web service, and added a Solr interface - both of which made
a refresh of this package worth doing. 

This package will also be a dependency in my package taxize, simplifying
taxize because taxize currently has a lot of internal code to work with 
ITIS data.

Thanks!
Scott Chamberlain
