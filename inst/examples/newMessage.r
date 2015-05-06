newMessage()
newMessage("CustomMessage", c("Header", Hello = "World!", "Unnamed element"))
newMessage("CustomMessage", c("Some information", Hello = "World!", "Unnamed element"),
  header = FALSE)
newMessage("CustomMessage", "Some information", time = FALSE)
newMessage("CustomMessage", "Some information", pid = FALSE)
newMessage("CustomMessage", "Some information", include_condition = FALSE)

## Typical use case inside of a function
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
