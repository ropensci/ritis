context("description")

skip_on_cran()

test_that("description basic functionality works", {
  vcr::use_cassette("description", {
    aa <- description()
  })
  
  expect_is(aa, "character")
  expect_match(aa, "ITIS Web Service")
})

test_that("description - xml works", {
  vcr::use_cassette("description-xml", {
    aa <- description(wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("description - raw JSON works", {
  vcr::use_cassette("description-json", {
    aa <- description(raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("description fails well", {
  expect_error(description(wt = "ffa"), "'wt' must be one of")
})
