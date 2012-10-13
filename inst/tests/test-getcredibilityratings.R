# tests for getcredibilityratings fxn in ritis
context("getcredibilityratings")

test_that("getcredibilityratings returns the correct value", {
	expect_that(getcredibilityratings()[1,], matches("Minimum taxonomic/nomenclature review"))
	expect_that(getcredibilityratings()[3,], matches("No review; untreated NODC dat"))
})

test_that("getcredibilityratings returns the correct class", {
	expect_that(getcredibilityratings(), is_a("data.frame"))
	expect_that(nrow(getcredibilityratings()), equals(4))
})
