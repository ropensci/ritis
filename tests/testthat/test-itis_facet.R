context("itis_facet")

test_that("itis_facet basic functionality works", {
  skip_on_cran()

  aa <- sm(itis_facet(q = "rank:Species", rows = 0, facet.field = "kingdom"))

  expect_is(aa, "list")
  expect_is(aa$facet_fields, "list")
  expect_is(aa$facet_fields[[1]], "data.frame")
  expect_null(aa$facet_queries)
  expect_null(aa$facet_pivot)
  expect_null(aa$facet_dates)
  expect_null(aa$facet_ranges)

  expect_named(aa$facet_fields, "kingdom")
  expect_named(aa$facet_fields[[1]], c('term', 'value'))
})

test_that("itis_facet fails well", {
  skip_on_cran()

  expect_error(sm(itis_facet(foo = "bar")),
               "didn't detect any facet. fields - at least 1 required")

  expect_error(sm(itis_facet(wt = "asdfaddf")))
})
