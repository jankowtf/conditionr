context("signalCondition-1")
test_that("signalCondition", {

    expect_is(res <- signalCondition(), "RappDefaultMessage")
    expect_warning(
      expect_is(res <- signalCondition(type = "warning"), "RappDefaultWarning")
    )
    expect_error(res <- signalCondition(type = "error"))
    
    expect_is(res <- signalCondition(signal = FALSE), "RappDefaultMessage")
    expect_is(res <- signalCondition(type = "warning", signal = FALSE), 
      "RappDefaultWarning")
    expect_is(res <- signalCondition(type = "error", signal = FALSE),
      "RappDefaultError")
    
    expect_is(res <- signalCondition(
      condition = "TestCondition"), "TestCondition")
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
