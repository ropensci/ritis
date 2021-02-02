context("common_names")

skip_on_cran()

test_that("common_names basic functionality works", {
  vcr::use_cassette("common_names", {
    aa <- common_names(tsn = 183833)
  })
  
  # TSN accepted - good name, empty data.frame returned
  expect_is(aa, "data.frame")
  expect_equal(NROW(aa), 3)
  for (i in aa) expect_is(i, "character")
})

test_that("common_names - xml works", {
  vcr::use_cassette("common_names-xml", {
    aa <- common_names(183833, wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("common_names - raw JSON works", {
  vcr::use_cassette("common_names-json", {
    aa <- common_names(183833, raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("common_names fails well", {
  expect_error(common_names(), "\"tsn\" is missing")

  expect_error(common_names("asdfafasffd", wt = "ffa"), "'wt' must be one of")

  vcr::use_cassette("common_names-errors", {
    expect_error(common_names("asdfadf"))
  })
})
