context("coverage")

skip_on_cran()

test_that("coverage basic functionality works", {
  vcr::use_cassette("coverage", {
    aa <- coverage(tsn = 28727)
    bb <- coverage(tsn = 526852)
  })
  
  # coverage and currrency data
  expect_is(aa, "data.frame")
  expect_equal(NROW(aa), 1)
  expect_is(aa$taxonCoverage, "character")
  expect_equal(aa$taxonCoverage, "partial")

  # no coverage or currrency data
  expect_is(bb, "data.frame")
  expect_equal(NROW(bb), 1)
  expect_is(bb$taxonCoverage, "character")
  expect_equal(nchar(bb$taxonCoverage), 0)
})

test_that("coverage - xml works", {
  vcr::use_cassette("coverage-xml", {
    aa <- coverage(28727, wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("coverage - raw JSON works", {
  vcr::use_cassette("coverage-json", {
    aa <- coverage(28727, raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("coverage fails well", {
  expect_error(coverage(), "\"tsn\" is missing")

  expect_error(coverage("asdfafasffd", wt = "ffa"), "'wt' must be one of")

  vcr::use_cassette("coverage-errors", {
    expect_error(coverage("asdfadf"))
  })
})
