# tests for getanymatchcount fxn in ritis
context("getanymatchcount")

test_that("getanymatchcount returns the correct value", {
	expect_that(getanymatchcount(202385)$return, matches("1"))
	expect_that(getanymatchcount("dolphin")$return, matches("110"))
})

test_that("getanymatchcount returns the correct class", {
	expect_that(getanymatchcount(202385), is_a("list"))
	expect_that(getanymatchcount(202385)$return, is_a("character"))
	expect_that(getanymatchcount("dolphin"), is_a("list"))
})
