# tests for getfullhierarchyfromtsn fxn in ritis
context("getfullhierarchyfromtsn")

test_that("getfullhierarchyfromtsn returns the correct value", {
	expect_that(getfullhierarchyfromtsn(tsn = 37906)$tsn[1:5], matches(c("202422","846492","846494","846496","846504")))
})

test_that("getfullhierarchyfromtsn returns the correct class", {
	expect_that(getfullhierarchyfromtsn(tsn = 37906), is_a("data.frame"))
	expect_that(nrow(getfullhierarchyfromtsn(tsn = 37906)), equals(60))
})
