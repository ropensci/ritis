context("date_data")

skip_on_cran()

test_that("date_data basic functionality works", {
  vcr::use_cassette("date_data", {
    aa <- date_data(tsn = 28727)
  })
  
  expect_is(aa, "data.frame")
  expect_equal(NROW(aa), 1)
  expect_is(aa$updateDate, "character")
})

test_that("date_data - xml works", {
  vcr::use_cassette("date_data-xml", {
    aa <- date_data(28727, wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("date_data - raw JSON works", {
  vcr::use_cassette("date_data-json", {
    aa <- date_data(28727, raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("date_data fails well", {
  expect_error(date_data(), "\"tsn\" is missing")

  expect_error(date_data("asdfafasffd", wt = "ffa"), "'wt' must be one of")

  vcr::use_cassette("date_data-errors", {
    expect_error(date_data("asdfadf"))
  })
})
