context("terms")

skip_on_cran()

test_that("terms - both", {
  vcr::use_cassette("terms_both", {
    aa <- terms(query='brown bear')
  })
  
  expect_is(aa, "data.frame")
  expect_gt(NROW(aa), 1)
  expect_is(aa$author, "character")
  expect_is(aa$commonNames, "list")
  expect_is(aa$nameUsage, "character")
  expect_is(aa$scientificName, "character")
  expect_is(aa$tsn, "character")
})

test_that("terms - scientific", {
  vcr::use_cassette("terms_scientific", {
    aa <- terms(query='Poa annua', "scientific")
  })
  
  expect_is(aa, "data.frame")
  expect_gt(NROW(aa), 10)
  expect_is(aa$author, "character")
  expect_is(aa$commonNames, "list")
  expect_is(aa$nameUsage, "character")
  expect_is(aa$scientificName, "character")
  expect_is(aa$tsn, "character")
})

test_that("terms - scientific", {
  vcr::use_cassette("terms_common", {
    aa <- terms(query="hayfield tarweed", "common")
  })
  
  expect_is(aa, "data.frame")
  expect_gt(NROW(aa), 5)
  expect_is(aa$author, "character")
  expect_is(aa$commonNames, "list")
  expect_is(aa$nameUsage, "character")
  expect_is(aa$scientificName, "character")
  expect_is(aa$tsn, "character")
})

test_that("terms fails well", {
  expect_error(terms(), "\"query\" is missing")

  expect_error(terms("asdfafasffd", wt = "ffa"),
    "'wt' must be one of")
})
