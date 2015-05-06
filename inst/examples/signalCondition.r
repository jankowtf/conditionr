\dontrun{

##------------------------------------------------------------------------------
## Messages
##------------------------------------------------------------------------------

# 1) Emtpy messag -------------------------------------------------------

## Signaled right away //
## Note that an actuall message is issued in the console
res <- signalCondition()
class(res)

## Not signaled right away, only condition object is returned //
res <- signalCondition(signal = FALSE)
res
class(res)
## Explicit issuing:
message(res)

## Custom condition class(es) //
res <- signalCondition(condition = "CustomMessage")
class(res)
res <- signalCondition(condition = c("CustomMessage1", "CustomMessage2"))
class(res)


# 2) Custom message -----------------------------------------------

## Single-line:
res <- signalCondition(
  condition = "CustomMessage",
  msg = "Hello world!",
  signal = FALSE
)
res
message(res)
## --> note that condition classis only displayed for the *unsignaled*
## condition. That's why the condition itself is also included in the prefix
## by default (can be suppressed via `include_condition`)

## Suppress time:
res <- signalCondition(
  condition = "CustomMessage",
  msg = "Hello world!",
  signal = FALSE,
  time = FALSE
)
res
message(res)

## Suppress PID:
res <- signalCondition(
  condition = "CustomMessage",
  msg = "Hello world!",
  signal = FALSE,
  pid = FALSE
)
res
message(res)

## Suppress condition in prefix:
res <- signalCondition(
  condition = "CustomMessage",
  msg = "Hello world!",
  signal = FALSE,
  include_condition = FALSE
)
res
message(res)

## Suppress time, PID and condition:
res <- signalCondition(
  condition = "CustomMessage",
  msg = "Hello world!",
  signal = FALSE,
  time = FALSE,
  pid = FALSE,
  include_condition = FALSE
)
res
message(res)

## Multi-line:
res <- signalCondition(
  condition = "CustomMessage",
  msg = c(Hello = "world!"),
  signal = FALSE
)
res
message(res)

## With header:
res <- signalCondition(
  condition = "CustomMessage",
  msg = c("Header", "Name with whitespace" = "test", Hello = "World!"),
  signal = FALSE
)
res
message(res)

## Without header:
res <- signalCondition(
  condition = "CustomMessage",
  msg = c("Name with whitespace" = "test", "Unnamed element", Hello = "World!"),
  signal = FALSE
)
res
message(res)
## --> note that named elements are never used as headers

res <- signalCondition(
  condition = "CustomMessage",
  msg = c("I'm not a header", "Unnamed element",
    "Name with whitespace" = "test", Hello = "World!"),
  signal = FALSE,
  header = FALSE
)
res
message(res)
## --> note that if `msg` contains an unnamed element at the first position,
## it will be treated as the header unless `header = FALSE`

## Include namespace //
## You can use this argument in order to denote the package/namespace
## that contains the function/method/closure that produces the condition
res <- signalCondition(ns = "my.package", signal = FALSE)
res

## Illustration of the typical use within a function //
## Note that the name of the function is automatically added:
foo <- function(x = TRUE) {
  if (x == TRUE) {
    return("Hello World!")
  } else {
    signalCondition(
      condition = "AppropriateCondition",
      msg = c(
        "This is the header",
        Details = "illustration of a custom condition",
        "Some more information"
      ),
      ns = "my.package",
      type = "message"
    )
    return("Hello World!")
  }
}
foo()
foo(x = FALSE)

##------------------------------------------------------------------------------
## Warnings
##------------------------------------------------------------------------------

# 1) Empty warning --------------------------------------------------------

## Signaled right away //
## Note that an actuall warning is issued in the console
res <- signalCondition(type = "warning")
class(res)

## Not signaled, only condition object is returned //
res <- signalCondition(type = "warning", signal = FALSE)
res
class(res)
## Explicit issuing:
warning(res)
## --> we gave no warning message, that's why nothing is issued

## Custom condition class(es) //
res <- signalCondition(
  condition = "CustomWarning",
  type = "warning"
)
class(res)

res <- signalCondition(
  condition = c("CustomWarning1", "CustomWarning2"),
  type = "warning"
)
class(res)

# 2) Custom warning message -----------------------------------------------

## Single-line:
res <- signalCondition(
  condition = "CustomWarning",
  msg = "Hello world!",
  type = "warning",
  signal = FALSE
)
res
warning(res)
## --> note that condition classis only displayed for the *unsignaled*
## condition. That's why the condition itself is also included in the prefix
## by default (can be suppressed via `include_condition`)

## Suppress time:
res <- signalCondition(
  condition = "CustomWarning",
  msg = "Hello world!",
  type = "warning",
  signal = FALSE,
  time = FALSE
)
res
warning(res)

## Suppress PID:
res <- signalCondition(
  condition = "CustomWarning",
  msg = "Hello world!",
  type = "warning",
  signal = FALSE,
  pid = FALSE
)
res
warning(res)

## Suppress condition in prefix:
res <- signalCondition(
  condition = "CustomWarning",
  msg = "Hello world!",
  type = "warning",
  signal = FALSE,
  include_condition = FALSE
)
res
warning(res)

## Suppress time, PID and condition:
res <- signalCondition(
  condition = "CustomWarning",
  msg = "Hello world!",
  type = "warning",
  signal = FALSE,
  time = FALSE,
  pid = FALSE,
  include_condition = FALSE
)
res
warning(res)

## Multi-line:
res <- signalCondition(
  condition = "CustomWarning",
  msg = c(Hello = "world!"),
  type = "warning",
  signal = FALSE
)
res
warning(res)

## With header:
res <- signalCondition(
  condition = "CustomWarning",
  msg = c("Header", "Name with whitespace" = "test", Hello = "World!"),
  type = "warning",
  signal = FALSE
)
res
warning(res)

## Without header:
res <- signalCondition(
  condition = "CustomWarning",
  msg = c("Name with whitespace" = "test", "Unnamed element", Hello = "World!"),
  type = "warning",
  signal = FALSE
)
res
warning(res)
## --> note that named elements are never used as headers

res <- signalCondition(
  condition = "CustomWarning",
  msg = c("I'm not a header", "Unnamed element",
    "Name with whitespace" = "test", Hello = "World!"),
  type = "warning",
  signal = FALSE,
  header = FALSE
)
res
warning(res)
## --> note that if `msg` contains an unnamed element at the first position,
## it will be treated as the header unless `header = FALSE`

## Include namespace //
## You can use this argument in order to denote the package/namespace
## that contains the function/method/closure that produces the condition
res <- signalCondition(ns = "my.package", type = "warning", signal = FALSE)
warning(res)

## Illustration of the typical use within a function //
## Note that the name of the function is automatically added:
foo <- function(x = TRUE) {
  if (x == TRUE) {
    return("Hello World!")
  } else {
    signalCondition(
      condition = "AppropriateCondition",
      msg = c(
        "This is the header",
        Details = "illustration of a custom condition",
        "Some more information"
      ),
      ns = "my.package",
      type = "warning"
    )
    return("Hello World!")
  }
}
foo()
foo(x = FALSE)

##------------------------------------------------------------------------------
## Errors
##------------------------------------------------------------------------------

# 1) Empty error ----------------------------------------------------------

## Signaled right away //
## Note that an actuall error is issued in the console
signalCondition(type = "error")

## Not signaled, only condition object is returned //
res <- signalCondition(type = "error", signal = FALSE)
res

## Explicit issuing:
stop(res)

## Custom condition class(es) //
res <- signalCondition(
  condition = "CustomError",
  type = "error",
  signal = FALSE
)
class(res)
res <- signalCondition(
  condition = c("CustomError1", "CustomError2"),
  type = "error",
  signal = FALSE
)
class(res)


# 2) Custom error message -------------------------------------------------

## Single-line:
res <- signalCondition(
  condition = "CustomError",
  msg = "Hello world!",
  type = "error",
  signal = FALSE
)
res
stop(res)
## --> note that condition classis only displayed for the *unsignaled*
## condition. That's why the condition itself is also included in the prefix
## by default (can be suppressed via `include_condition`)

## Suppress time:
res <- signalCondition(
  condition = "CustomError",
  msg = "Hello world!",
  type = "error",
  signal = FALSE,
  time = FALSE
)
res
stop(res)

## Suppress PID:
res <- signalCondition(
  condition = "CustomError",
  msg = "Hello world!",
  type = "error",
  signal = FALSE,
  pid = FALSE
)
res
stop(res)

## Suppress condition in prefix:
res <- signalCondition(
  condition = "CustomError",
  msg = "Hello world!",
  type = "error",
  signal = FALSE,
  include_condition = FALSE
)
res
stop(res)

## Suppress time, PID and condition:
res <- signalCondition(
  condition = "CustomError",
  msg = "Hello world!",
  type = "error",
  signal = FALSE,
  time = FALSE,
  pid = FALSE,
  include_condition = FALSE
)
res
stop(res)

## Multi-line:
res <- signalCondition(
  condition = "CustomError",
  msg = c(Hello = "world!"),
  type = "error",
  signal = FALSE
)
res
stop(res)

## With header:
res <- signalCondition(
  condition = "CustomError",
  msg = c("Header", "Name with whitespace" = "test", Hello = "World!"),
  type = "error",
  signal = FALSE
)
res
stop(res)

## Without header:
res <- signalCondition(
  condition = "CustomError",
  msg = c("Name with whitespace" = "test", "Unnamed element", Hello = "World!"),
  type = "error",
  signal = FALSE
)
res
stop(res)
## --> note that named elements are never used as headers

res <- signalCondition(
  condition = "CustomError",
  msg = c("I'm not a header", "Unnamed element",
    "Name with whitespace" = "test", Hello = "World!"),
  type = "error",
  signal = FALSE,
  header = FALSE
)
res
stop(res)
## --> note that if `msg` contains an unnamed element at the first position,
## it will be treated as the header unless `header = FALSE`

## Include namespace //
## You can use this argument in order to denote the package/namespace
## that contains the function/method/closure that produces the condition
res <- signalCondition(ns = "my.package", type = "error", signal = FALSE)
stop(res)

## Illustration of the typical use within a function //
## Note that the name of the function is automatically added:
foo <- function(x = TRUE) {
  if (x == TRUE) {
    return("Hello World!")
  } else {
    signalCondition(
      condition = "AppropriateCondition",
      msg = c(
        "This is the header",
        Details = "illustration of a custom condition",
        "Some more information"
      ),
      ns = "my.package",
      type = "error"
    )
    return("Hello World!")
  }
}
foo()
foo(x = FALSE)
