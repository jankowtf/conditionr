newError()
newError("CustomError", c("Header", Hello = "World!", "Unnamed element"))
newError("CustomError", c("Some information", Hello = "World!", "Unnamed element"),
  header = FALSE)
newError("CustomError", "Some information", time = FALSE)
newError("CustomError", "Some information", pid = FALSE)
newError("CustomError", "Some information", include_condition = FALSE)

foo <- function(x) {
  withCallingHandlers({
    out <- log(x)
    newMessage("StatusIsOk", "Everything worked just fine")
    out},
    warning = function(cond) {
      newWarning("StatusIsWarning",
        c("We have a warning", "Actual warning message" = conditionMessage(cond))
      )
      invokeRestart("muffleWarning")
    },
    error = function(cond) {
      newError("StatusIsError",
        c("We have an error", "Actual error message" = conditionMessage(cond))
      )
    }
  )
}
(x <- foo(1))
(x <- foo(-1))
(x <- foo("a"))
