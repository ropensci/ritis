context("record")

test_that("record basic functionality works", {
  skip_on_cran()

  aa <- record(lsid = "urn:lsid:itis.gov:itis_tsn:180543")

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_is(aa$lsid, "character")
  expect_gt(NROW(aa), 0)
})

test_that("record - xml works", {
  skip_on_cran()

  aa <- record(lsid = "urn:lsid:itis.gov:itis_tsn:180543", wt = "xml")

  expect_is(aa, "character")
  expect_match(aa, "xmlns")
})

test_that("record - raw JSON works", {
  skip_on_cran()

  aa <- record(lsid = "urn:lsid:itis.gov:itis_tsn:180543", raw = TRUE)

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("record fail well", {
  skip_on_cran()

  expect_error(record(), "\"lsid\" is missing")

  expect_error(record(lsid = "urn:lsid:itis.gov:itis_tsn:180543", wt = "ffa"), "'wt' must be one of")

  # lsid's not found lead to 0 row data.frame's
  tmp <- record(lsid = "asdfasdf")
  expect_is(tmp, "tbl_df")
  expect_equal(NROW(tmp), 0)
})
