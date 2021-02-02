context("accepted_names")

skip_on_cran()

test_that("accepted_names basic functionality works", {
  vcr::use_cassette("accepted_names", {
    aa <- accepted_names(tsn = 208527)
    bb <- accepted_names(tsn = 504239)
  })
  
  # TSN accepted - good name, empty data.frame returned
  expect_is(aa, "data.frame")
  expect_equal(NROW(aa), 0)

  # TSN not accepted - input TSN is old name, non-empty data.frame returned
  expect_is(bb, "data.frame")
  expect_equal(NROW(bb), 1)
  expect_equal(bb$acceptedName, "Dasiphora fruticosa")
})

test_that("accepted_names - xml works", {
  vcr::use_cassette("accepted_names-xml", {
    aa <- accepted_names(504239, wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("accepted_names - raw JSON works", {
  vcr::use_cassette("accepted_names-json", {
    aa <- accepted_names(504239, raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("accepted_names fails well", {
  expect_error(accepted_names(), "\"tsn\" is missing")

  expect_error(accepted_names("asdfafasffd", wt = "ffa"), "'wt' must be one of")

  vcr::use_cassette("accepted_names-errors", {
    expect_error(accepted_names("asdfadf"))
  })
})
