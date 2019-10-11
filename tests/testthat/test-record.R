context("record")

test_that("record basic functionality works", {
  vcr::use_cassette("record", {
    aa <- record(lsid = "urn:lsid:itis.gov:itis_tsn:180543")
  })

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_is(aa$lsid, "character")
  expect_gt(NROW(aa), 0)
})

test_that("record - xml works", {
  vcr::use_cassette("record-xml", {
    aa <- record(lsid = "urn:lsid:itis.gov:itis_tsn:180543", wt = "xml")
  })

  expect_is(aa, "character")
  expect_match(aa, "xmlns")
})

test_that("record - raw JSON works", {
  vcr::use_cassette("record-json", {
    aa <- record(lsid = "urn:lsid:itis.gov:itis_tsn:180543", raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("record fail well", {
  expect_error(record(), "\"lsid\" is missing")

  expect_error(record(lsid = "urn:lsid:itis.gov:itis_tsn:180543", wt = "ffa"), "'wt' must be one of")

  vcr::use_cassette("record-fails-well", {
    # lsid's not found lead to 0 row data.frame's
    tmp <- record(lsid = "asdfasdf")
    expect_is(tmp, "tbl_df")
    expect_equal(NROW(tmp), 0)
  })
})
