context("newError")

test_that("newError", {

  expect_error(expect_is(res <- newError(), "DefaultError"),
    "\\d+.*/DefaultError")
  expect_error(newError("CustomError", c("A", "B", "C")), "CustomError")
  expect_error(newError("CustomError", "A", time = FALSE),
    "\\d{4,6}/force/CustomError")
  expect_error(newError("CustomError", "A", pid = FALSE),
    "\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}/force/CustomError")

})

