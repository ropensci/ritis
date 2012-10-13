# tests for getcoveragefromtsn fxn in ritis
context("getcoveragefromtsn")

test_that("getcoveragefromtsn returns the correct value", {
	expect_that(getcoveragefromtsn(tsn = 28727)$taxoncoverage, matches("partial"))
	expect_that(getcoveragefromtsn(tsn = 28727)$rankid, matches("180"))
	expect_that(getcoveragefromtsn(tsn = 526852)$rankid, matches("240"))
})

test_that("getcoveragefromtsn returns the correct class", {
	expect_that(getcoveragefromtsn(tsn = 28727), is_a("data.frame"))
})
