\dontrun{
  
##------------------------------------------------------------------------------
## Messages 
##------------------------------------------------------------------------------

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

## Custom condition message //
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
  msg = c("Name with whitespace" = "test", Hello = "World!"),
  signal = FALSE
)
res
message(res)

## Include namespace //
## You can use this argument in order to denote the package/namespace
## that contains the function/method/closure that produces the condition
res <- signalCondition(ns = "my.package", signal = FALSE)
res 

## Illustration of the typical use within a function/method/closure //
## Note that the name of the function/method/closure is automatically added:
foo <- function(x = TRUE) {
  if (x == TRUE) {
    return("Hello World!")  
  } else {
    signalCondition(
      condition = "ArgumentXHasValueFalse",
      msg = c(
        "Header",
        Details = "illustration of a custom condition"
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

## Signaled right away //
## Note that an actuall warning is issued in the console
res <- signalCondition(type = "warning"), "RappDefaultWarning")
class(res)

## Not signaled, only condition object is returned //
res <- signalCondition(type = "warning", signal = FALSE)
res
class(res)
## Explicit issuing:
warning(res)

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

## Custom condition message //
## With header:
res <- signalCondition(
  condition = "CustomWarning",
  msg = c("Header", "Name with whitespace" = "test", Hello = "World!"),
  type = "warning",
  signal = FALSE
)
res
message(res)

## Without header:
res <- signalCondition(
  condition = "CustomWarning",
  msg = c("Name with whitespace" = "test", Hello = "World!"),
  type = "warning",
  signal = FALSE
)
res
message(res)

## Include namespace //
## You can use this argument in order to denote the package/namespace
## that contains the function/method/closure that produces the condition
res <- signalCondition(ns = "my.package", type = "warning", signal = FALSE)
res


## Illustration of the typical use within a function/method/closure //
## Note that the name of the function/method/closure is automatically added:
foo <- function(x = TRUE) {
  if (x == TRUE) {
    return("Hello World!")  
  } else {
    signalCondition(
      condition = "ArgumentXHasValueFalse",
      msg = c(
        "Header",
        Details = "illustration of a custom condition"
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

## Signaled right away //
## Note that an actuall error is issued in the console
signalCondition(type = "error")

## Not signaled, only condition object is returned //
res <- signalCondition(type = "error", signal = FALSE)
res 
(res)
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

## Custom condition message //
## With header:
res <- signalCondition(
  condition = "CustomError",
  msg = c("Header", "Name with whitespace" = "test", Hello = "World!"),
  type = "error",
  signal = FALSE
)
res
message(res)

## Without header:
res <- signalCondition(
  condition = "CustomError",
  msg = c("Name with whitespace" = "test", Hello = "World!"),
  type = "error",
  signal = FALSE
)
res
message(res)

## Include namespace //
## You can use this argument in order to denote the package/namespace
## that contains the function/method/closure that produces the condition
res <- signalCondition(ns = "my.package", type = "error", signal = FALSE)
res

## Illustration of the typical use within a function/method/closure //
## Note that the name of the function/method/closure is automatically added:
foo <- function(x = TRUE) {
  if (x == TRUE) {
    return("Hello World!")  
  } else {
    signalCondition(
      condition = "ArgumentXHasValueFalse",
      msg = c(
        "Header",
        Details = "illustration of a custom condition"
      ),
      ns = "my.package", 
      type = "error"
    )
  }
}
foo()
foo(x = FALSE)

}
