context("itis_highlight")

test_that("itis_highlight basic functionality works", {
  skip_on_cran()

  aa <- sm(itis_highlight(q = "rank:Species", hl.fl = 'rank', rows = 10))

  expect_is(aa, "list")
  expect_is(aa[[1]], "list")
  expect_is(aa[[1]][[1]], "character")
  expect_named(aa[[1]], "rank")
})

test_that("itis_highlight fails well", {
  skip_on_cran()

  expect_error(sm(itis_highlight(foo = "bar")),
               "unused argument")

  expect_error(sm(itis_highlight(wt = "asdfaddf")))
})
