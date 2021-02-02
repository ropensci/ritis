skip_on_cran()


context("credibility_rating")

test_that("credibility_rating basic functionality works", {
  vcr::use_cassette("credibility_rating", {
    aa <- credibility_rating(tsn = 526852)
  })
  
  expect_is(aa, "data.frame")
  expect_equal(NROW(aa), 1)
  expect_is(aa$credRating, "character")
  expect_equal(aa$credRating, "TWG standards met")
})

test_that("credibility_rating - xml works", {
  vcr::use_cassette("credibility_rating-xml", {
    aa <- credibility_rating(28727, wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("credibility_rating - raw JSON works", {
  vcr::use_cassette("credibility_rating-json", {
    aa <- credibility_rating(28727, raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("credibility_rating fails well", {
  expect_error(credibility_rating(), "\"tsn\" is missing")

  expect_error(credibility_rating("asdfafasffd", wt = "ffa"), "'wt' must be one of")

  vcr::use_cassette("credibility_rating-errors", {
    expect_error(credibility_rating("asdfadf"))
  })
})



context("credibility_ratings")

test_that("credibility_ratings basic functionality works", {
  vcr::use_cassette("credibility_ratings", {
    aa <- credibility_ratings()
  })
  
  expect_is(aa, "data.frame")
  expect_is(aa$credibilityValues, "character")
})
