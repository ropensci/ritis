context("jurisdiction functions")

test_that("jurisdictional_origin basic functionality works", {
  vcr::use_cassette("jurisdictional_origin", {
    aa <- jurisdictional_origin(tsn=180543)

    expect_is(aa, "data.frame")
    expect_is(aa, "tbl_df")

    expect_is(aa$origin, "character")
    expect_gt(NROW(aa), 0)
  })
})

test_that("jurisdiction_origin_values - basic functionality works", {
  vcr::use_cassette("jurisdictional_origin_values", {
    aa <- jurisdiction_origin_values()

    expect_is(aa, "data.frame")
    expect_is(aa, "tbl_df")

    expect_named(aa, c('jurisdiction', 'origin'))
  })
})

test_that("jurisdiction_values - basic functionality works", {
  vcr::use_cassette("jurisdiction_values", {
    aa <- jurisdiction_values()

    expect_is(aa, "character")

    expect_gt(length(aa), 1)
  })
})

test_that("jurisdiction functions fail well", {
  
  expect_error(jurisdictional_origin(), "\"tsn\" is missing")

  expect_error(jurisdiction_origin_values(wt = "ffa"), "'wt' must be one of")

  expect_error(jurisdiction_values(wt = "ffa"), "'wt' must be one of")

  vcr::use_cassette("jurisdictional_origin-fails-well", {
    # lsid's not found lead 404
    expect_error(jurisdictional_origin(tsn = "asdfasdf"),
      "Bad Request \\(HTTP 400\\)", class = "error")
  })
})
