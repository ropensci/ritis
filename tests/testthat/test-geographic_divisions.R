context("geographic_divisions")

skip_on_cran()

test_that("geographic_divisions", {
  vcr::use_cassette("geographic_divisions", {
    aa <- geographic_divisions(tsn = 180543)
  })
  
  expect_is(aa, "data.frame")
  expect_equal(NROW(aa), 3)
  for (i in aa) expect_is(i, "character")
})

test_that("geographic_divisions - xml works", {
  vcr::use_cassette("geographic_divisions-xml", {
    aa <- geographic_divisions(180544, wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("geographic_divisions - raw JSON works", {
  vcr::use_cassette("geographic_divisions-json", {
    aa <- geographic_divisions(180544, raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("geographic_divisions fails well", {
  expect_error(geographic_divisions(), "\"tsn\" is missing")

  expect_error(geographic_divisions("asdfafasffd", wt = "ffa"),
    "'wt' must be one of")

  vcr::use_cassette("geographic_divisions-errors", {
    expect_error(geographic_divisions("asdfadf"))
  })
})
