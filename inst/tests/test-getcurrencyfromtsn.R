# tests for getcurrencyfromtsn fxn in ritis
context("getcurrencyfromtsn")
 
test_that("getcurrencyfromtsn returns the correct value", {
	expect_that(getcurrencyfromtsn(tsn = 28727)$rankid, matches("180"))
	expect_that(getcurrencyfromtsn(tsn = 526852)$tsn, matches("526852"))
})

test_that("getcurrencyfromtsn returns the correct class", {
	expect_that(getcurrencyfromtsn(tsn = 28727), is_a("data.frame"))
})
