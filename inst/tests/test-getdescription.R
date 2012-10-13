# tests for getdescription fxn in ritis
context("getdescription")

test_that("getdescription returns the correct value", {
	expect_that(getdescription(), equals("This is the ITIS Web Service, providing access to the data behind www.itis.gov. The database contains 607,608 scientific names (463,086 of them valid/accepted) and 116,477 common names."))
})

test_that("getdescription returns the correct number of characters", {
	expect_that(nchar(getdescription()), equals(185))
})
