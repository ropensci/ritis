context("publications")

test_that("publications basic functionality works", {
  vcr::use_cassette("publications", {
    aa <- publications(tsn = 70340)
  })

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_is(aa$isbn, "character")
  expect_gt(NROW(aa), 0)
})

test_that("publications - xml works", {
  vcr::use_cassette("publications-xml", {
    aa <- publications(tsn = 70340, wt = "xml")
  })

  expect_is(aa, "character")
  expect_match(aa, "xmlns")
})

test_that("publications - raw JSON works", {
  vcr::use_cassette("publications-json", {
    aa <- publications(tsn = 70340, raw = TRUE)
  })
  
  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("publications fails well", {
  expect_error(publications(), "\"tsn\" is missing")
  expect_error(publications(tsn = 70340, wt = "ffa"), "'wt' must be one of")

  vcr::use_cassette("publications-fails-well", {
    # tsn's not found lead to 404
    expect_error(publications(tsn = "Asdfasdfa"),
      "Bad Request \\(HTTP 400\\)", class = "error")
  })
})
