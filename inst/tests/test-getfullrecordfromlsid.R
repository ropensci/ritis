# tests for getfullrecordfromlsid fxn in ritis
context("getfullrecordfromlsid")

test_that("getfullrecordfromlsid returns the correct class", {
	expect_that(getfullrecordfromlsid(lsid = "urn:lsid:itis.gov:itis_tsn:180543"), is_a("XMLInternalDocument"))
})
