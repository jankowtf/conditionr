context("newWarning")

test_that("newWarning", {

  expect_warning(expect_is(res <- newWarning(), "DefaultWarning"),
    "\\d+.*/DefaultWarning")
  expect_warning(newWarning("CustomWarning", c("A", "B", "C")), "CustomWarning")
  expect_warning(newWarning("CustomWarning", "A", time = FALSE),
    "\\d{4,6}/withVisible/CustomWarning")
  expect_warning(newWarning("CustomWarning", "A", pid = FALSE),
    "\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}/withVisible/CustomWarning")

})

