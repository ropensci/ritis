# tests for getdatedatafromtsn fxn in ritis
context("getdatedatafromtsn")

test_that("getdatedatafromtsn returns the correct value", {
	expect_that(getdatedatafromtsn(tsn = 180543)$initialTimeStamp, matches("1996-06-13 14:51:08.0"))
	expect_that(as.character(getdatedatafromtsn(tsn = 180543)$tsn), matches("180543"))
})

test_that("getdatedatafromtsn returns the correct class", {
	expect_that(getdatedatafromtsn(tsn = 180543), is_a("data.frame"))
	expect_that(nrow(getdatedatafromtsn(tsn = 180543)), equals(1))
})
