context("itis_highlight")

test_that("itis_highlight basic functionality works", {
  vcr::use_cassette("itis_highlight", {
    aa <- sm(itis_highlight(q = "rank:Species", hl.fl = 'rank', rows = 10))
  })

  expect_is(aa, "tbl_df")
  expect_is(aa$rank[1], "character")
  expect_is(aa$names[1], "character")
  expect_named(aa, c("names", "rank"))
})

test_that("itis_highlight fails well", {
  skip_on_cran()

  expect_error(sm(itis_highlight(foo = "bar")),
               "some keys not in acceptable set")

  expect_error(sm(itis_highlight(wt = "asdfaddf")),
    "wt must be one of")
})
