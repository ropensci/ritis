context("geographic_values")

skip_on_cran()

test_that("geographic_values", {
  vcr::use_cassette("geographic_values", {
    aa <- geographic_values()
  })
  
  expect_is(aa, "character")
  expect_gt(length(aa), 10)
})

test_that("geographic_values - xml works", {
  vcr::use_cassette("geographic_values-xml", {
    aa <- geographic_values(wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("geographic_values - raw JSON works", {
  vcr::use_cassette("geographic_values-json", {
    aa <- geographic_values(raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("geographic_values fails well", {
  expect_error(geographic_values(wt = "ffa"),
    "'wt' must be one of")
})
