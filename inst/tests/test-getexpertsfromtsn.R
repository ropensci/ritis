# tests for getexpertsfromtsn fxn in ritis
context("getexpertsfromtsn")

test_that("getexpertsfromtsn returns the correct value", {
	expect_that(getexpertsfromtsn(tsn = 180544)[1,"expert"], matches("Alfred L. Gardner"))
})

test_that("getexpertsfromtsn returns the correct class", {
	expect_that(getexpertsfromtsn(tsn = 180544), is_a("data.frame"))
})
