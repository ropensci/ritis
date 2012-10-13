# tests for getcommonnamesfromtsn fxn in ritis
context("getcommonnamesfromtsn")

test_that("getcommonnamesfromtsn returns the correct value", {
	expect_that(getcommonnamesfromtsn(183833)[1,1], matches("African hunting dog"))
	expect_that(getcommonnamesfromtsn(183833)[1,2], matches("English"))
	expect_that(getcommonnamesfromtsn(183833)[1,3], matches("183833"))
})

test_that("getcommonnamesfromtsn returns the correct class", {
	expect_that(getcommonnamesfromtsn(183833), is_a("data.frame"))
})
