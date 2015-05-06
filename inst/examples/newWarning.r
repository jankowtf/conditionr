newWarning()
newWarning("CustomWarning", c("Header", Hello = "World!", "Unnamed element"))
newWarning("CustomWarning", c("Some information", Hello = "World!", "Unnamed element"),
  header = FALSE)
newWarning("CustomWarning", "Some information", time = FALSE)
newWarning("CustomWarning", "Some information", pid = FALSE)
newWarning("CustomWarning", "Some information", include_condition = FALSE)

## Typical use case inside of a function //
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
