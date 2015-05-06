context("signalCondition")

test_that("signalCondition", {

#     condition = "A"
#     msg = "hello"
#     msg = c("hello", "world")
#     ns = NULL
#     ns = "ns"
#     call = sys.call()
#     call = "foo()"
#     type = c("message", "warning", "error", "condition")
#     type = "message"
#     signal = TRUE
#
#     header = FALSE
#     time = FALSE
#     pid = FALSE

    expect_message(expect_is(res <- signalCondition(), "DefaultMessage"), "\\d+")
    expect_warning(
      expect_is(res <- signalCondition(type = "warning"), "DefaultWarning")
    )
    expect_error(res <- signalCondition(type = "error"))

    expect_is(res <- signalCondition(signal = FALSE), "DefaultMessage")
    expect_is(res <- signalCondition(type = "warning", signal = FALSE),
      "DefaultWarning")
    expect_is(res <- signalCondition(type = "error", signal = FALSE),
      "DefaultError")

    expect_message(expect_is(res <- signalCondition(
      condition = "TestCondition"), "TestCondition"))
    expect_true(inherits(res, "message"))
    expect_warning(
        expect_is(res <- signalCondition(
          condition = "TestCondition",
          type = "warning"
        ), "TestCondition")
    )
    expect_true(inherits(res, "warning"))
    expect_error(res <- signalCondition(
      condition = "TestCondition",
      type = "error")
    )

    expect_is(res <- signalCondition(
        condition = "TestCondition",
        signal = FALSE
      ), "TestCondition")
    expect_true(inherits(res, "message"))
    expect_is(res <- signalCondition(
        condition = "TestCondition",
        type = "warning",
        signal = FALSE
      ), "TestCondition")
    expect_true(inherits(res, "warning"))
    expect_is(res <- signalCondition(
        condition = "TestCondition",
        type = "error",
        signal = FALSE
      ), "TestCondition"
    )
    expect_true(inherits(res, "error"))

    expect_is(res <- signalCondition(
        condition = "TestCondition",
        msg = c("Header", "Line 1" = "line 1", "Line 2" = "line 2"),
        signal = FALSE
      ), "TestCondition")
    expect_match(paste(res, collapse="\n"), "Line 1")
    expect_is(res <- signalCondition(
        condition = "TestCondition",
        msg = c("Header", "Line 1" = "line 1", "Line 2" = "line 2"),
        type = "warning",
        signal = FALSE
      ), "TestCondition")
    expect_match(paste(res, collapse="\n"), "Line 1")
    expect_is(res <- signalCondition(
        condition = "TestCondition",
        msg = c("Header", "Line 1" = "line 1", "Line 2" = "line 2"),
        type = "error",
        signal = FALSE
      ), "TestCondition"
    )
    expect_match(paste(res, collapse="\n"), "Line 1")
    expect_true(inherits(res, "error"))

  }
)

