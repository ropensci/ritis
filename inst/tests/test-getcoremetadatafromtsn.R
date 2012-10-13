# tests for getcoremetadatafromtsn fxn in ritis
context("getcoremetadatafromtsn")

test_that("getcoremetadatafromtsn returns the correct value", {
	expect_that(getcoremetadatafromtsn(tsn = 28727)$credRating, matches("TWG standards met"))
	expect_that(getcoremetadatafromtsn(tsn = 28727)$taxonCoverage, matches("partial"))
	expect_that(getcoremetadatafromtsn(tsn = 28727)$taxonUsageRating, matches("accepted"))
})

test_that("getcoremetadatafromtsn returns the correct class", {
	expect_that(getcoremetadatafromtsn(tsn = 28727), is_a("data.frame"))
})
