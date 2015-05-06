#' @title
#' New message
#'
#' @description
#' Creates a custom message. A convenience wrapper around
#' \code{\link[conditionr]{signalCondition}}.
#'
#' @param ... Arguments passed along to \code{\link[conditionr]{signalCondition}}
#'  except \code{call} and \code{type} as these are automatically set.
#' @example inst/examples/newMessage.r
#' @seealso \code{
#' 		\link[conditionr]{signalCondition}
#' }
#' @template author
#' @template references
#' @export

newMessage <- function(
  ...
) {
  # signalCondition(..., call = sys.call(-1), type = "message")
  signalCondition(..., type = "message")
}

#' @title
#' New Warning
#'
#' @description
#' Creates a custom warning. A convenience wrapper around
#' \code{\link[conditionr]{signalCondition}}.
#'
#' @param ... Arguments passed along to \code{\link[conditionr]{signalCondition}}
#'  except \code{call} and \code{type} as these are automatically set.
#' @example inst/examples/newWarning.r
#' @seealso \code{
#' 		\link[conditionr]{signalCondition}
#' }
#' @template author
#' @template references
#' @export

newWarning <- function(
  ...
) {
  signalCondition(..., call = sys.call(-1), type = "warning")
}

#' @title
#' New error
#'
#' @description
#' Creates a custom error. A convenience wrapper around
#' \code{\link[conditionr]{signalCondition}}.
#'
#' @param ... Arguments passed along to \code{\link[conditionr]{signalCondition}}
#'  except \code{call} and \code{type} as these are automatically set.
#' @example inst/examples/newError.r
#' @seealso \code{
#' 		\link[conditionr]{signalCondition}
#' }
#' @template author
#' @template references
#' @export

newError <- function(
  ...
) {
  signalCondition(..., call = sys.call(-1), type = "error")
}

