#' Get accepted names from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' # TSN accepted - good name
#' accepted_names(tsn='208527')
#'
#' # TSN not accepted - input TSN is old name
#' accepted_names('504239')
#'
#' # raw json
#' accepted_names(tsn='208527', raw = TRUE)
#' # raw xml
#' accepted_names(tsn='208527', wt = "xml", raw = TRUE)
#' }
accepted_names <- function(tsn, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getAcceptedNamesFromTSN", list(tsn = tsn), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(
    wt,
    json = {
      if (inherits(x$acceptedNames, "data.frame")) {
        names(x$acceptedNames) <- tolower(names(x$acceptedNames))
        c(submittedtsn = x$tsn, c(as.list(x$acceptedNames)[c('acceptedname', 'acceptedtsn')]))
      } else {
        as.list(c(submittedtsn = x$tsn, acceptedname = NA, acceptedtsn = NA))
      }
    },
    xml = {
      x_tsn <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:tsn", xml2::xml_ns(x)))
      x_acc_names <- lapply(xml2::xml_children(xml2::as_list(xml2::xml_find_all(x, "//ax21:acceptedNames", xml2::xml_ns(x)))[[1]]), function(z) {
        as.list(setNames(xml2::xml_text(z), xml2::xml_name(z)))
      })
      if (length(x_acc_names) < 2) {
        x_tsn
      } else {
        nmslwr(unlist(c(submittedtsn = x_tsn, x_acc_names[1:2]), FALSE))
      }
    }
  )
}

#' Get any match count.
#'
#' @export
#' @template common
#' @param x text or taxonomic serial number (TSN) (character or numeric)
#' @return An integer containing the number of matches the search will return.
#' @examples \dontrun{
#' any_match_count(202385)
#' any_match_count("dolphin")
#' }
any_match_count <- function(x, wt = "json", raw = FALSE, ...) {
	x <- itis_GET("getAnyMatchCount", list(srchKey = x), wt = wt, ...)
	if (raw) return(x)
	x <- parse_raw(wt, x)
	switch(wt, json = x$return, xml = as.numeric(xml2::xml_text(x)))
}

#' Get comment detail from TSN
#'
#' @export
#' @template tsn
#' @template common
#' @return A data.frame with results.
#' @examples \dontrun{
#' comment_detail(tsn=180543)
#' comment_detail(tsn=180543, wt = "xml")
#' library(httr)
#' comment_detail(tsn=180543, config=verbose())
#' }
comment_detail <- function(tsn, wt = "json", raw = FALSE, ...) {
	x <- itis_GET("getCommentDetailFromTSN", list(tsn = tsn), wt, ...)
	if (raw) return(x)
	x <- parse_raw(wt, x)
	switch(wt, json = x, xml = {
	    namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
	    matches <- c("commentDetail", "commentId", "commentTimeStamp", "commentator","updateDate")
	    colnames <- c('comment','commid','commtime','commentator','updatedate')
	    nmslwr(itisdf(a = x, b = namespaces, matches = matches, colnames = colnames))
	  }
	)
}

#' Get common names from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' common_names(tsn=183833)
#' common_names(tsn=183833, wt = "xml")
#' }
common_names <- function(tsn, wt = "json", raw = FALSE, ...) {
	x <- itis_GET("getCommonNamesFromTSN", list(tsn = tsn), wt, ...)
	if (raw) return(x)
	x <- parse_raw(wt, x)
	switch(wt, json = x, xml = {
	    namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
	    comname <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:commonName", xml2::xml_ns(x)))
	    lang <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:language", xml2::xml_ns(x)))
	    tsn <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:tsn", xml2::xml_ns(x)))
	    data.frame(comname = comname, lang = lang, tsn = tsn[-length(tsn)], stringsAsFactors = FALSE)
	  }
	)
}

#' Get core metadata from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' # coverage and currrency data
#' core_metadata(tsn=28727)
#' core_metadata(tsn=28727, wt = "xml")
#' # no coverage or currrency data
#' core_metadata(183671)
#' core_metadata(183671, wt = "xml")
#' }
core_metadata <- function(tsn, wt = "json", raw = FALSE, ...) {
	x <- itis_GET("getCoreMetadataFromTSN", list(tsn = tsn), wt, ...)
	if (raw) return(x)
	x <- parse_raw(wt, x)
	switch(wt, json = x, xml = {
	    namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
	    toget <- list("credRating","rankId","taxonCoverage","taxonCurrency","taxonUsageRating","tsn")
	    itis_parse(a = toget, b = x, d = namespaces)
	  }
	)
}

#' Get coverge from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' # coverage data
#' coverage(tsn=28727)
#' # no coverage data
#' coverage(526852)
#' coverage(526852, wt = "xml")
#' }
coverage <- function(tsn, wt = "json", raw = FALSE, ...) {
	x <- itis_GET("getCoverageFromTSN", list(tsn = tsn), wt, ...)
	if (raw) return(x)
	x <- parse_raw(wt, x)
	switch(wt, json = x, xml = {
	    namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
	    matches <- c("rankId", "taxonCoverage", "tsn")
	    itisdf(a = x, b = namespaces, matches, colnames = tolower(matches))
	  }
	)
}

#' Get credibility rating from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' credibility_rating(526852)
#' credibility_rating(526852, wt = "xml")
#' credibility_rating(526852, wt = "xml", raw = TRUE)
#' credibility_rating(526852, raw = TRUE)
#' }
credibility_rating <- function(tsn, wt = "json", raw = FALSE, ...) {
	x <- itis_GET("getCredibilityRatingFromTSN", list(tsn = tsn), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x, xml = {
      namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
      matches <- c("credRating", "tsn")
      itisdf(x, namespaces, matches, tolower(matches))
    }
  )
}

#' Get possible credibility ratings
#'
#' @export
#' @template common
#' @examples \dontrun{
#' credibility_ratings()
#' credibility_ratings(wt = "xml")
#' credibility_ratings(raw = TRUE)
#' credibility_ratings(wt = "xml", raw = TRUE)
#' }
credibility_ratings <- function(wt = "json", raw = FALSE, ...) {
	x <- itis_GET("getCredibilityRatings", list(), wt, ...)
	if (raw) return(x)
	x <- parse_raw(wt, x)
	switch(wt, json = x, xml = {
	  namespaces <- c(ax23 = "http://metadata.itis_service.itis.usgs.gov/xsd")
	  xx <- xml2::xml_text(xml2::xml_find_all(x, "//ax23:credibilityValues", xml2::xml_ns(x)))
	  data.frame(credibilityvalues = xx, stringsAsFactors = FALSE)
	})
}

#' Get currency from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' # currency data
#' currency(tsn=28727)
#' currency(tsn=28727, wt = "xml")
#' # no currency dat
#' currency(526852)
#' currency(526852, raw = TRUE)
#' }
currency <- function(tsn, wt = "json", raw = FALSE, ...) {
	x <- itis_GET("getCurrencyFromTSN", list(tsn = tsn), wt, ...)
	if (raw) return(x)
	x <- parse_raw(wt, x)
	switch(wt, json = x, xml = {
	  namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd")
	  matches <- c("rankId","taxonCurrency","tsn")
	  nmslwr(itisdf(x, namespaces, matches, tolower(matches)))
	})
}

#' Get date data from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' date_data(180543)
#' date_data(180543, wt = "xml")
#' date_data(180543, wt = "xml", raw = TRUE)
#' }
date_data <- function(tsn, wt = "json", raw = FALSE, ...) {
	x <- itis_GET("getDateDataFromTSN", list(tsn = tsn), wt, ...)
	if (raw) return(x)
	x <- parse_raw(wt, x)
	switch(wt, json = x, xml = {
	  namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd")
	  matches <- c("initialTimeStamp","updateDate","tsn")
	  nmslwr(itisdf(x, namespaces, matches, tolower(matches)))
	})
}

#' Get description of the ITIS service
#'
#' @export
#' @template common
#' @examples \dontrun{
#' description()
#' }
description <- function(wt = "json", raw = FALSE, ...){
  x <- itis_GET("getDescription", list(), wt, ...)
  if (raw) return(x)
  x <- parse_raw(wt, x)
  switch(wt, json = x$description, xml = xml2::xml_text(xml2::xml_find_all(x, "//ns:return", xml2::xml_ns(x)))[[1]])
}

#' Get expert information for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' experts(180544)
#' experts(180544, wt = "xml")
#' }
experts <- function(tsn, wt = "json", raw = FALSE, ...) {
	x <- itis_GET("getExpertsFromTSN", list(tsn = tsn), wt, ...)
	if (raw) return(x)
	x <- parse_raw(wt, x)
	switch(wt, json = x, xml = {
	  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
	  toget <- list("comment","expert","name","referredTsn","referenceFor","updateDate")
	  xpathfunc <- function(z) {
	    xml2::xml_text(xml2::xml_find_all(x, paste0("//ax21:", z), namespaces))
	  }
	  nmslwr(setNames(do.call(cbind, lapply(toget, function(z) as.data.frame(xpathfunc(z)))), toget))
	})
}

#' Get full hierarchy from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' full_hierarchy(tsn=37906)
#' full_hierarchy(tsn=37906, raw = TRUE)
#' full_hierarchy(100800, wt = "xml")
#' }
full_hierarchy <- function(tsn, wt = "json", raw = FALSE, ...) {
	x <- itis_GET("getFullHierarchyFromTSN", list(tsn = tsn), wt, ...)
	if (raw) return(x)
	x <- parse_raw(wt, x)
	switch(wt, json = x, xml = {
	  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
	  parentName <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:parentName", xml2::xml_ns(x)))
	  parentTsn <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:parentTsn", xml2::xml_ns(x)))
	  rankName <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:rankName", xml2::xml_ns(x)))
	  taxonName <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:taxonName", xml2::xml_ns(x)))
	  tsn <- xml2::xml_text(xml2::xml_find_all(x, "//ax21:tsn", xml2::xml_ns(x)))
	  nmslwr(data.frame(parentName = parentName, parentTsn = parentTsn,
	                    rankName = rankName[-length(rankName)],
	                    taxonName = taxonName, tsn = tsn[-1], stringsAsFactors = FALSE))
	})
}

#' Get geographic divisions from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' geographic_divisions(tsn=180543, config=timeout(3))
#' }
geographic_divisions <- function(tsn, wt = "json", raw = FALSE, ...) {
	out <- itis_GET("getGeographicDivisionsFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("geographicValue","updateDate")
	itis_parse(toget, out, namespaces)
}

#' Get all possible geographic values
#'
#' @export
#' @template common
#' @examples \dontrun{
#' geographic_values()
#' }
geographic_values <- function(wt = "json", raw = FALSE, ...) {
	out <- itis_GET("getGeographicValues", list(), wt, ...)
  namespaces <- c(ax21 = "http://metadata.itis_service.itis.usgs.gov/xsd")
  geographicValues <- xml2::xml_text(xml2::xml_find_all(out, "//ax21:geographicValues", namespaces))
  data.frame(geographicvalues = geographicValues, stringsAsFactors = FALSE)
}

#' Get global species completeness from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' global_species_completeness(tsn=180541, config=timeout(3))
#' }
global_species_completeness <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getGlobalSpeciesCompletenessFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("completeness","rankId","tsn")
  itis_parse(toget, out, namespaces)
}

#' Get hierarchy down from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' hierarchy_down(tsn=161030, config=timeout(3))
#' }
hierarchy_down <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getHierarchyDownFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  matches <- paste0("hierarchyList/ax21:",
                    c("parentName","parentTsn","rankName","taxonName","tsn"))
  df <- itisdf(out, namespaces, matches, tolower(c("parentName","parentTsn","rankName","taxonName","tsn")))
  df$rankname <- tolower(df$rankname)
  df
}

#' Get hierarchy up from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' hierarchy_up(tsn=36485, config=timeout(3))
#' }
hierarchy_up <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getHierarchyUpFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  matches <- c("parentName","parentTsn","rankName","taxonName","tsn")
  itisdf(out, namespaces, matches, tolower(matches))
}

#' Get jurisdictional origin from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' jurisdictional_origin(tsn=180543)
#' }
jurisdictional_origin <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getJurisdictionalOriginFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("jurisdictionValue","origin","updateDate")
  xpathfunc <- function(x) {
    xml2::xml_text(xml2::xml_find_all(out, paste("//ax21:", x, sep = ''), namespaces))
  }
  df <- do.call(cbind, lapply(toget, function(z) as.data.frame(xpathfunc(z))))
  if (NROW(df) == 0) {
    data.frame(jurisdictionvalue = NA, origin = NA, updatedate = NA, stringsAsFactors = FALSE)
  } else {
    setNames(df, tolower(toget))
  }
}

#' Get jurisdiction origin values
#'
#' @export
#' @template common
#' @examples \dontrun{
#' jurisdiction_origin_values(config=timeout(3))
#' }
jurisdiction_origin_values <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getJurisdictionalOriginValues", list(), wt, ...)
  namespaces <- c(ax23 = "http://metadata.itis_service.itis.usgs.gov/xsd")
  matches <- c("jurisdiction","origin")
  itisdf(a = out, b = namespaces, matches = matches, colnames = tolower(matches), pastens = "ax23")
}

#' Get possible jurisdiction values
#'
#' @export
#' @template common
#' @examples \dontrun{
#' jurisdiction_values(config=timeout(3))
#' }
jurisdiction_values <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getJurisdictionValues", list(), wt, ...)
  namespaces <- c(ax23 = "http://metadata.itis_service.itis.usgs.gov/xsd")
  jurisdictionValues <- xml2::xml_text(xml2::xml_find_all(out, "//ax23:jurisdictionValues", namespaces))
  data.frame(jurisdictionvalues = jurisdictionValues, stringsAsFactors = FALSE)
}

#' Get kingdom names from tsn
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' kingdom_name(202385, config=timeout(3))
#' }
kingdom_name <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getKingdomNameFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("kingdomId","kingdomName","tsn")
  itis_parse(toget, out, namespaces)
}

#' Get all possible kingdom names
#'
#' @export
#' @template common
#' @examples \dontrun{
#' kingdom_names(config=timeout(3))
#' }
kingdom_names <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getKingdomNames", list(), wt, ...)
  namespaces <- c(ax21 = "http://metadata.itis_service.itis.usgs.gov/xsd")
  matches <- c("kingdomId","kingdomName","tsn")
  itisdf(out, namespaces, matches, tolower(matches))
}

#' Provides the date the ITIS database was last updated.
#'
#' @export
#' @template common
#' @examples \dontrun{
#' last_change_date(config=timeout(3))
#' }
last_change_date <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getLastChangeDate", list(), wt, ...)
  namespaces <- c(ax21 = "http://metadata.itis_service.itis.usgs.gov/xsd")
  xml2::xml_text(xml2::xml_find_all(out, "//ax21:updateDate", namespaces))
}

#' Gets the unique LSID for the TSN, or an empty result if there is no match.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' tsn2lsid(155166)
#' }
tsn2lsid <- function(tsn, wt = "json", raw = FALSE, ...) {
  x <- itis_GET("getLSIDFromTSN", list(tsn = tsn), wt, ...)
  xml2::xml_text(xml2::xml_children(x))
}

#' Returns a list of the other sources used for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' other_sources(tsn=182662, config=timeout(3))
#' }
other_sources <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getOtherSourcesFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("acquisitionDate","name","referredTsn","source",
                "sourceType","updateDate","version")
  xpathfunc <- function(x) {
    xml2::xml_text(xml2::xml_find_all(out, paste("//ax21:", x, sep = ''), namespaces))
  }
  nmslwr(setNames(do.call(cbind, lapply(toget, function(z) as.data.frame(xpathfunc(z)))), toget))
}

#' Returns the parent TSN for the entered TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' parent_tsn(202385, config=timeout(3))
#' }
parent_tsn <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getParentTSNFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("parentTsn","tsn")
  itis_parse(toget, out, namespaces)
}

#' Returns a list of the pulications used for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' publications(70340)
#' }
publications <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getPublicationsFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("actualPubDate","isbn","issn","listedPubDate","pages",
                "pubComment","pubName","pubPlace","publisher","referenceAuthor",
                "name","refLanguage","referredTsn","title","updateDate")
  xpathfunc <- function(x) {
    xml2::xml_text(xml2::xml_find_all(out, paste("//ax21:", x, sep = ''), namespaces))
  }
  df <-  do.call(cbind, lapply(toget, function(z) as.data.frame(xpathfunc(z))))
  if (NROW(df) > 0) names(df) <- tolower(toget)
  df
}

#' Provides a list of all the unique rank names contained in the database and
#'  their kingdom and rank ID values.
#'
#' @export
#' @template common
#' @examples \dontrun{
#' rank_names(config=timeout(3))
#' }
rank_names <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getRankNames", list(), wt, ...)
  namespaces <- c(ax23 = "http://metadata.itis_service.itis.usgs.gov/xsd")
  matches <- c("kingdomName","rankId","rankName")
  itisdf(out, namespaces, matches, tolower(matches), "ax23")
}

#' Gets the partial ITIS record for the TSN in the LSID, found by comparing the
#'  TSN in the search key to the TSN field. Returns an empty result set if
#'  there is no match or the TSN is invalid.
#'
#' @export
#' @template common
#' @param lsid lsid for a taxonomic group (character). Required.
#' @examples \dontrun{
#' record("urn:lsid:itis.gov:itis_tsn:180543", config=timeout(5))
#' }
record <- function(lsid, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getRecordFromLSID", list(lsid = lsid), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("authorship","genusPart","infragenericEpithet",
                "infraspecificEpithet","lsid","nameComplete","nomenclaturalCode",
                "rank","rankString","specificEpithet","uninomial","tsn")
  itis_parse(toget, out, namespaces)
}

#' Returns the review year for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' review_year(180541, config=timeout(3))
#' }
review_year <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getReviewYearFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("rankId","reviewYear","tsn")
  itis_parse(toget, out, namespaces)
}

#' Returns the scientific name for the TSN. Also returns the component parts
#'    (names and indicators) of the scientific name.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' scientific_name(531894, config=timeout(3))
#' }
scientific_name <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getScientificNameFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("combinedName","unitInd1","unitInd3","unitName1","unitName2",
                "unitName3","tsn")
  itis_parse(toget, out, namespaces)
}

#' Returns a list of the synonyms (if any) for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' synonym_names(tsn=183671) # tsn not accepted
#' synonym_names(tsn=526852) # tsn accepted
#' }
synonym_names <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getSynonymNamesFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd")
  nodes <- xml2::xml_text(xml2::xml_find_all(out, "//ax21:sciName", namespaces))
  if ( length(nodes) == 0 ) {
    name <- "nomatch"
  } else {
    name <- nodes
  }
  nodes <- xml2::xml_text(xml2::xml_find_all(out, "//ax21:tsn", namespaces))
  if ( length(nodes) == 1 ) {
    tsn <- nodes
  } else {
    tsn <- nodes[-1]
  }
  data.frame(name = name, tsn = tsn, stringsAsFactors = FALSE)
}

#' Returns the author information for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' taxon_authorship(183671, config=timeout(3))
#' }
taxon_authorship <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTaxonAuthorshipFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("authorship","updateDate","tsn")
  itis_parse(toget, out, namespaces)
}

#' Returns the kingdom and rank information for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' rank_name(202385, config=timeout(3))
#' }
rank_name <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTaxonomicRankNameFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("kingdomId","kingdomName","rankId","rankName","tsn")
  itis_parse(toget, out, namespaces)
}

#' Returns the usage information for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' usage(526852, config=timeout(3))
#' }
usage <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTaxonomicUsageFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("taxonUsageRating","tsn")
  itis_parse(toget, out, namespaces)
}

#' Get tsn by vernacular language
#'
#' @export
#' @template common
#' @param language A string containing the language. This is a language string,
#'    not the international language code (character)
#' @examples \dontrun{
#' # tsn_by_vernacular_language("french", config=timeout(3))
#' }
tsn_by_vernacular_language <- function(language, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTsnByVernacularLanguage", list(language = language), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  matches <- c("commonName","language","tsn")
  itisdf(out, namespaces, matches, tolower(matches))
}

#' Gets the TSN corresponding to the LSID, or an empty result if there is no match.
#'
#' @export
#' @template common
#' @param lsid lsid for a taxonomic group (character). Required.
#' @examples \dontrun{
#' lsid2tsn(lsid="urn:lsid:itis.gov:itis_tsn:28726", config=timeout(3))
#' lsid2tsn("urn:lsid:itis.gov:itis_tsn:0", config=timeout(3))
#' }
lsid2tsn <- function(lsid, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getTSNFromLSID", list(lsid = lsid), wt, ...)
  tmp <- suppressWarnings(as.numeric(xml2::xml_text(xml2::xml_find_one(out, "ns:return", xml2::xml_ns(out)))))
  if (!is.na(tmp)) {
    tmp
  } else {
    return("invalid TSN")
  }
}

#' Returns the unacceptability reason, if any, for the TSN.
#'
#' @export
#' @template common
#' @template tsn
#' @examples \dontrun{
#' unacceptability_reason(183671, config=timeout(3))
#' }
unacceptability_reason <- function(tsn, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getUnacceptabilityReasonFromTSN", list(tsn = tsn), wt, ...)
  namespaces <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))
  toget <- list("tsn","unacceptReason")
  itis_parse(toget, out, namespaces)
}

#' Provides a list of the unique languages used in the vernacular table.
#'
#' @export
#' @template common
#' @examples \dontrun{
#' vernacular_languages()
#' }
vernacular_languages <- function(wt = "json", raw = FALSE, ...) {
  out <- itis_GET("getVernacularLanguages", list(), wt, ...)
  namespaces <- c(ax21 = "http://metadata.itis_service.itis.usgs.gov/xsd")
  languageNames <- xml2::xml_text(xml2::xml_find_all(out, "//ax21:languageNames", namespaces))
  data.frame(languagenames = languageNames, stringsAsFactors = FALSE)
}

#' Search by scientific name
#'
#' @export
#' @template common
#' @inheritParams any_match_count
#' @examples \dontrun{
#' search_scientific("Tardigrada", config=timeout(3))
#' search_scientific("Quercus douglasii", config=timeout(3))
#' }
search_scientific <- function(x, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("searchByScientificName", list(srchKey = x), wt, ...)
  namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd")
  matches <- c("combinedName","tsn")
  itisdf(out, namespaces, matches, tolower(matches))
}

#' Search for any match
#'
#' @export
#' @template common
#' @inheritParams any_match_count
#' @examples \dontrun{
#' search_anymatch(x=202385, config=timeout(3))
#' search_anymatch(x="dolphin", config=timeout(3))
#' }
search_anymatch <- function(x, wt = "json", raw = FALSE, ...) {
  out <- itis_GET("searchForAnyMatch", list(srchKey = x), wt, ...)
  ns <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd")

  if (is.character(x)) {
    me <- xml2::xml_find_all(out, "//ax21:anyMatchList", ns)
    comname <- vapply(me, foosam, "", y = 'commonName', ns = ns)
    comname_lang <- vapply(me, foosam, "", y = 'language', ns = ns)
    sciname <- vapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:sciName", ns)), "")
    tsn <- vapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:tsn", ns)), "")
    data.frame(tsn=tsn, sciname=sciname, comname=comname, comname_lang=comname_lang, stringsAsFactors = FALSE)
  } else {
    me <- xml2::xml_find_all(out, "//ax21:commonNames", ns)
    comname <- sapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:commonName", ns)))
    comname_tsn <- sapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:tsn", ns)))
    comname_lang <- sapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:language", ns)))
    data.frame(tsn=comname_tsn, comname=comname, comname_lang=comname_lang, stringsAsFactors = FALSE)
  }
}

foosam <- function(x, y, ns) {
  tt <- xml2::xml_find_one(x, "ax21:commonNameList", ns)
  ttt <- tryCatch(xml2::xml_find_all(tt, "ax21:commonNames", ns), error = function(e) e)
  if (!inherits(ttt, "error")) {
    tttt <- tryCatch(xml2::xml_find_one(ttt, paste0("ax21:", y), ns), error = function(e) e)
    if (!inherits(ttt, "error")) {
      xx <- xml2::xml_text(tttt)
      if (length(xx) > 1) {
        paste0(xx, collapse = ",")
      } else if (length(xx) == 0) {
        ""
      } else {
        xx
      }
    } else {
      ""
    }
  } else {
    ""
  }
}

#' Search for any matched page
#'
#' @export
#' @template common
#' @inheritParams any_match_count
#' @param pagesize An integer containing the page size (numeric)
#' @param pagenum An integer containing the page number (numeric)
#' @param ascend A boolean containing true for ascending sort order or false
#'    for descending (logical)
#' @examples \dontrun{
#' search_any_match_paged(x=202385, pagesize=100, pagenum=1, ascend=FALSE)
#' search_any_match_paged(x="Zy", pagesize=100, pagenum=1, ascend=FALSE)
#' }
search_any_match_paged <- function(x, pagesize = NULL, pagenum = NULL, ascend = NULL, wt = "json", raw = FALSE, ...) {
  args <- tc(list(srchKey=x, pageSize=pagesize, pageNum=pagenum, ascend=ascend))
  out <- itis_GET("searchForAnyMatchPaged", args, wt, ...)
  ns <- c(namespaces <- c(ax21 = "http://data.itis_service.itis.usgs.gov/xsd"))

  if (is.character(x)) {
    me <- xml2::xml_find_all(out, "//ax21:anyMatchList", ns)
    comname <- vapply(me, foosam, "", y = 'commonName', ns = ns)
    comname_lang <- vapply(me, foosam, "", y = 'language', ns = ns)
    sciname <- vapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:sciName", ns)), "")
    tsn <- vapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:tsn", ns)), "")
    data.frame(tsn=tsn, sciname=sciname, comname=comname, comname_lang=comname_lang, stringsAsFactors = FALSE)
  } else {
    me <- xml2::xml_find_all(out, "//ax21:commonNames", ns)
    comname <- sapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:commonName", ns)))
    comname_tsn <- sapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:tsn", ns)))
    comname_lang <- sapply(me, function(x) xml2::xml_text(xml2::xml_find_one(x, "ax21:language", ns)))
    data.frame(tsn=comname_tsn, comname=comname, comname_lang=comname_lang, stringsAsFactors = FALSE)
  }
}
