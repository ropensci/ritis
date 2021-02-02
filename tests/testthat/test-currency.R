context("currency")

skip_on_cran()

test_that("currency basic functionality works", {
  vcr::use_cassette("currency", {
    aa <- currency(tsn = 28727)
    bb <- currency(tsn = 526852)
  })
  
  # currrency data
  expect_is(aa, "data.frame")
  expect_equal(NROW(aa), 1)
  expect_is(aa$taxonCurrency, "character")
  expect_equal(aa$taxonCurrency, "2011")

  # no currency data
  expect_is(bb, "data.frame")
  expect_equal(NROW(bb), 1)
  expect_is(bb$taxonCurrency, "character")
  expect_equal(nchar(bb$taxonCurrency), 0)
})

test_that("currency - xml works", {
  vcr::use_cassette("currency-xml", {
    aa <- currency(28727, wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("currency - raw JSON works", {
  vcr::use_cassette("currency-json", {
    aa <- currency(28727, raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("currency fails well", {
  expect_error(currency(), "\"tsn\" is missing")

  expect_error(currency("asdfafasffd", wt = "ffa"), "'wt' must be one of")

  vcr::use_cassette("currency-errors", {
    expect_error(currency("asdfadf"))
  })
})
