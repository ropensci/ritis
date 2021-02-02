context("comment_detail")

skip_on_cran()

test_that("comment_detail basic functionality works", {
  vcr::use_cassette("comment_detail", {
    aa <- comment_detail(tsn = 180543)
  })
  
  # TSN accepted - good name, empty data.frame returned
  expect_is(aa, "data.frame")
  expect_equal(NROW(aa), 2)
  for (i in aa) expect_is(i, "character")
})

test_that("comment_detail - xml works", {
  vcr::use_cassette("comment_detail-xml", {
    aa <- comment_detail(180543, wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("comment_detail - raw JSON works", {
  vcr::use_cassette("comment_detail-json", {
    aa <- comment_detail(180543, raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("comment_detail fails well", {
  expect_error(comment_detail(), "\"tsn\" is missing")

  expect_error(comment_detail("asdfafasffd", wt = "ffa"), "'wt' must be one of")

  vcr::use_cassette("comment_detail-errors", {
    expect_error(comment_detail("asdfadf"))
  })
})
