# tests for getcredibilityratingfromtsn fxn in ritis
context("getcredibilityratingfromtsn")

test_that("getcredibilityratingfromtsn returns the correct value", {
	expect_that(getcredibilityratingfromtsn(tsn = 526852)$credrating, matches("TWG standards met"))
	expect_that(getcredibilityratingfromtsn(tsn = 526852)$tsn, matches("526852"))
})

test_that("getcredibilityratingfromtsn returns the correct class", {
	expect_that(getcredibilityratingfromtsn(tsn = 526852), is_a("data.frame"))
})
