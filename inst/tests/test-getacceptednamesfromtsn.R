# tests for getacceptednamesfromtsn fxn in ritis
context("getacceptednamesfromtsn")

test_that("getacceptednamesfromtsn returns the correct value", {
	expect_that(getacceptednamesfromtsn('208527'), matches("208527"))
	expect_that(getacceptednamesfromtsn(tsn='504239')$acceptedName, equals("Dasiphora fruticosa"))
})

test_that("getacceptednamesfromtsn returns the correct class", {
	expect_that(getacceptednamesfromtsn('208527'), is_a("character"))
	expect_that(getacceptednamesfromtsn(tsn='504239'), is_a("list"))
})
