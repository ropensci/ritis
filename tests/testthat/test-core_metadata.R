context("core_metadata")

skip_on_cran()

test_that("core_metadata basic functionality works", {
  vcr::use_cassette("core_metadata", {
    aa <- core_metadata(tsn = 183833)
    bb <- core_metadata(tsn = 183671)
  })
  
  # coverage and currrency data
  expect_is(aa, "data.frame")
  expect_equal(NROW(aa), 1)
  expect_is(aa$taxonUsageRating, "character")
  expect_equal(aa$taxonUsageRating, "valid")

  # no coverage or currrency data
  expect_is(bb, "data.frame")
  expect_equal(NROW(bb), 1)
  expect_is(bb$taxonUsageRating, "character")
  expect_equal(bb$taxonUsageRating, "not accepted")
})

test_that("core_metadata - xml works", {
  vcr::use_cassette("core_metadata-xml", {
    aa <- core_metadata(183833, wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("core_metadata - raw JSON works", {
  vcr::use_cassette("core_metadata-json", {
    aa <- core_metadata(183833, raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("core_metadata fails well", {
  expect_error(core_metadata(), "\"tsn\" is missing")

  expect_error(core_metadata("asdfafasffd", wt = "ffa"), "'wt' must be one of")

  vcr::use_cassette("core_metadata-errors", {
    expect_error(core_metadata("asdfadf"))
  })
})
