context("itis_search")

test_that("itis_search basic functionality works", {
  vcr::use_cassette("itis_search", {
    aa <- sm(itis_search(q = "tsn:182662"))
    bb <- sm(itis_search(q = "nameWOInd:Liquidamber\\%20styraciflua~0.4"))
    cc <- sm(itis_search(q = "nameWOInd:/[A-Ba-z0-9]*[%20]{0,0}*/"))

    expect_is(aa, "data.frame")
    expect_is(bb, "data.frame")
    expect_is(cc, "data.frame")

    expect_is(aa$tsn, "character")
    expect_true(grepl("Liquidambar", bb$nameWInd))
    expect_false(all(grepl("[C-D]", substring(cc$nameWOInd, 1, 1))))
  })
})

test_that("itis_search fails well", {
  skip_on_cran()

  vcr::use_cassette("itis_search-fails-well", {
    expect_identical(
      sm(itis_search(foo = "bar")),
      sm(itis_search())
    )
  })

  expect_error(itis_search(wt = "asdfaddf"),
               "must be one of")
})
