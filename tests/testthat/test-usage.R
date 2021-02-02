context("usage")

skip_on_cran()

test_that("usage basic functionality works", {
  vcr::use_cassette("usage", {
    aa <- usage(tsn = 526852)
  })
  
  expect_is(aa, "data.frame")
  expect_equal(NROW(aa), 1)
  for (i in aa) expect_is(i, "character")
})

test_that("usage - xml works", {
  vcr::use_cassette("usage-xml", {
    aa <- usage(526852, wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("usage - raw JSON works", {
  vcr::use_cassette("usage-json", {
    aa <- usage(526852, raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("usage fails well", {
  expect_error(usage(), "\"tsn\" is missing")

  expect_error(usage("asdfafasffd", wt = "ffa"),
    "'wt' must be one of")

  vcr::use_cassette("usage-errors", {
    expect_error(usage("asdfadf"))
  })
})
