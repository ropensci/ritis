ritis 1.0
=========

### MINOR IMPROVEMENTS

* reduce code duplication in `terms()` (#18)
* add more unit tests (#21)

### BUG FIXES

* fix for `publications()` function: parsing error fixed (#19) (#20)


ritis 0.9.0
===========

### MINOR IMPROVEMENTS

* an example added to `itis_search()` for how to do a search for Class Aves, and how to drill down from Class Aves to genera within Aves; added text to readme and vignette about how to cite ITIS and a brief comparison of ITIS to other taxonomic data sources; added brief terminology section to readme and vignette with 3 terms thus far (mononomial, binomial, trinomial) (#16) thanks to @TrashBirdEcology for the prompt
* change `tibble::data_frame` useage to `tibble::tibble` (#17)


ritis 0.8.0
===========

### MINOR IMPROVEMENTS

* updated docs and examples for `itis_search()` to demonstate how to search appropriately with spaces and other characters  (#14)

### BUG FIXES

* `itis_group()` was failing on a parsing error (after retrieving the payload), via an error in parsing in `solrium` package; fixed now (#15)


ritis 0.7.6
===========

### MINOR IMPROVEMENTS

* improve docs for solr functions, pointing to appropriate docs in `solrium` package (#12)
* give link to taxize book in readme, vignette, and pkg level manual file (#13)

### BUG FIXES

* fixed bug in `search_anymatch()`: we weren't correctly handling cases where no results were returned (#11)

Full diff: https://github.com/ropensci/ritis/compare/v0.7.2...v0.7.6


ritis 0.7.2
===========

### NEW FEATURES

* Integration with `vcr` and `webmockr` packages for unit test stubbing


ritis 0.7.0
===========

### NEW FEATURES

* Now using new version of `solrium` package - users shouldn't
see any differences (#9)


ritis 0.6.0
===========

### NEW FEATURES

* Now using `crul` as underlying HTTP client (#5)

### BUG FIXES

* Base URL change for Solr service from `http` to `https` (#8)
* Fixed JSON parsing problem (#6)


ritis 0.5.4
===========

### BUG FIXES

* Base URL changed from `http` to `https`, was causing problems in some
requests, but not others. Changed to `https` (#4)


ritis 0.5.0
===========

### NEW FEATURES

* Re-released to CRAN
* Complete overhaul of the package API, simplifying all function
interfaces, using JSON by default, shorter names, reduce code reuse.
* Added functions for interacting with ITIS's new Solr
interface via use of `solrium`


ritis 0.0.3
===========

### BUG FIXES

* Removed dependency on plyr - moved from laply to lapply across functions.


ritis 0.0.2
===========

### BUG FIXES

* Temporarily removed all tests until they can be fixed and updated, and so that package passes checks.


ritis 0.0.1
===========

### NEW FEATURES

* released to CRAN
