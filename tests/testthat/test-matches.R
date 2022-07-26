test_that("uss_make_matches works", {

  # use the function
  italy <- uss_make_matches(engsoccerdata::italy, "Italy")

  # check whether output is a tibble
  expect_true(tibble::is_tibble(italy))

  # check whether output has columns with the right names
  expect_named(italy,
               c("country", "tier", "season", "date", "home", "visitor",
                  "goals_home", "goals_visitor"))

  # check that the country column of the output is correct
  expect_identical(unique(italy$country), "Italy")

  # check that tier column is a factor
  # it is important that tier is a factor (when you find a bug, add a test)
  expect_s3_class(italy$tier, "factor")

  # setting new snapshot
  expect_snapshot(dplyr::glimpse(italy))

})
