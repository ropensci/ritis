context("experts")

skip_on_cran()

test_that("experts basic functionality works", {
  vcr::use_cassette("experts", {
    aa <- experts(tsn = 180544)
  })
  
  expect_is(aa, "data.frame")
  expect_equal(NROW(aa), 2)
  expect_is(aa$comment, "character")
  expect_is(aa$referenceFor, "list")
})

test_that("experts - xml works", {
  vcr::use_cassette("experts-xml", {
    aa <- experts(180544, wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("experts - raw JSON works", {
  vcr::use_cassette("experts-json", {
    aa <- experts(180544, raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("experts fails well", {
  expect_error(experts(), "\"tsn\" is missing")

  expect_error(experts("asdfafasffd", wt = "ffa"), "'wt' must be one of")

  vcr::use_cassette("experts-errors", {
    expect_error(experts("asdfadf"))
  })
})
