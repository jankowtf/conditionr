context("newMessage")

test_that("newMessage", {

  expect_message(expect_is(res <- newMessage(), "DefaultMessage"),
    "\\d+.*/DefaultMessage")
  expect_message(newMessage("CustomMessage", c("A", "B", "C")), "CustomMessage")
  expect_message(newMessage("CustomMessage", "A", time = FALSE),
    "\\d{4,6}/withVisible/CustomMessage")
  expect_message(newMessage("CustomMessage", "A", pid = FALSE),
    "\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}/withVisible/CustomMessage")

})

