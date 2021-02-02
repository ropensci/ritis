context("full_record")

skip_on_cran()

test_that("full_record tsn", {
  vcr::use_cassette("full_record_tsn", {
    aa <- full_record(tsn = 202385)
  })
  
  expect_is(aa, "list")
  expect_is(aa$publicationList, "list")
  expect_is(aa$coreMetadata, "list")
})

test_that("full_record lsid", {
  vcr::use_cassette("full_record_lsid", {
    bb <- full_record(lsid = "urn:lsid:itis.gov:itis_tsn:180543")
  })
  
  expect_is(bb, "list")
  expect_is(bb$publicationList, "list")
  expect_is(bb$coreMetadata, "list")
})

test_that("full_record fails well", {
  expect_error(full_record(4, 5), "only one of")

  vcr::use_cassette("full_record-errors", {
    expect_error(full_record("asdfadf"))
  })
})
