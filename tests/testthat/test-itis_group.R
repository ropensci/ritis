context("itis_group")

test_that("itis_group basic functionality works", {
  skip_on_cran()

  aa <- sm(itis_group(q = "nameWOInd:/[A-Za-z0-9]*[%20]{1,1}[A-Za-z0-9]*/",
                  group.field = 'rank', group.limit = 3))

  expect_is(aa, "data.frame")
  expect_true(any(grepl("group", names(aa))))
})

test_that("itis_group fails well", {
  skip_on_cran()

  expect_error(sm(itis_group()))

  expect_error(sm(itis_group(wt = "asdfaddf")))
})
