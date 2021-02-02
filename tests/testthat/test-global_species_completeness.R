context("global_species_completeness")

skip_on_cran()

test_that("global_species_completeness tsn", {
  vcr::use_cassette("global_species_completeness", {
    aa <- global_species_completeness(tsn = 180541)
  })
  
  expect_is(aa, "data.frame")
  expect_is(aa$completeness, "character")
  expect_is(aa$rankid, "integer")
  expect_is(aa$tsn, "character")
})

test_that("global_species_completeness - xml works", {
  vcr::use_cassette("global_species_completeness-xml", {
    aa <- global_species_completeness(180541, wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("global_species_completeness - raw JSON works", {
  vcr::use_cassette("global_species_completeness-json", {
    aa <- global_species_completeness(180541, raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("global_species_completeness fails well", {
  expect_error(global_species_completeness(), "\"tsn\" is missing")

  expect_error(global_species_completeness("asdfafasffd", wt = "ffa"),
    "'wt' must be one of")

  vcr::use_cassette("global_species_completeness-errors", {
    expect_error(global_species_completeness("asdfadf"))
  })
})

