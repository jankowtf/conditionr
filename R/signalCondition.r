#' @title
#' Signal Custom Condition
#'
#' @description 
#' Signals custom conditions.
#' 
#' @details
#' 		The returned object will always inherit from class of object \code{condition}.
#' 		The value of \code{condition} will always be the first entry/entries of the  
#' 		object's class graph.  
#' 		Depending on the setting of \code{type}, it also inherits from 
#' 		either \code{message}, \code{warning}, \code{error} or \code{custom}.
#' 		If no value for \code{condition} is specified, then depending on the setting
#' 		of \code{type} respective default values are used: \code{"DefaultMessage"},
#' 		\code{"RappDefaultWarning"}, \code{"RappDefaultError"} and 
#' 		\code{"RappDefaultCondition"}.
#'   	
#' @section Custom messages:
#'    When the first element in \code{msg} is unnamed, then it is regarded as 
#'    the messages's header which will be appended with \code{" //"}. Otherwise,
#'    message elements are regarded as name-value pairs that are displayed in
#'    the following format: \code{"* <name>: <value>"}.
#'    (e.g. \code{"* Line 1: hello world!"}).
#' 
#' @param condition \strong{Signature argument}.
#' 		Object containing condition information.
#' 		Usually, this is the name of a condition class that is to be used.
#' @param msg \code{\link{character}}. Dimension: any.
#' 		Condition message. Named components are transformed into the following
#' 		structure: \code{* <item>: <item-value>}, (e.g. "Item 1"="some message"
#' 		will become "* Item 1: some message" in the actual condition message.
#' 		The first element will be treated as the message's header.
#' 		Line numbers are automatically added beginning from the second line
#' 		(\code{[<number>] some message} or 
#' 		\code{[<number>] * <item>: <item-value>}).
#' @param ns \code{\link{character}}. 
#'    Optional namespace.
#' @param call \code{\link{call}}. Dimension: 1.
#' 		System call one frame up the calling stack. This will correspond to 
#' 		the closure that is spanned by the function/method that calls this 
#' 		method when a condition is to be signaled.
#' 		Default: \code{sys.call(-1)}. 
#' 		There should be no need to change this default value.
#' @param type \code{\link{character}}. Dimension: 1.
#' 		Selector for the condition type.
#' 		Choices: \code{"message"}, \code{"warning"}, \code{"error"} or 
#' 		\code{"condition"}.  
#' 		Default: \code{"message"}.
#' @param signal \code{\link{logical}}. Dimension: 1.
#' 		\code{TRUE} (default) means the condition is signaled right away, 
#' 		\code{FALSE} means the condition object is returned only.
#' @return Object of the class(es) that have been provided by \code{condition} and
#' 		also inheriting from \code{\link{condition}} and depending on
#' 		\code{type} also from \code{\link{message}}, \code{\link{warning}} or
#' 		\code{\link{error}}.
#' @example inst/examples/signalCondition.r
#' @seealso \code{
#' 		\link[rapp.core.condition]{signalCondition-character-method},
#'   	\link[rapp.core.condition]{signalCondition-missing-method},
#' 		\link[base]{condition}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "signalCondition",
  signature = c("condition"),
  def=function(
    condition,
    msg = NULL,
    ns = NULL,
    call = sys.call(-2),
    type = c("message", "warning", "error", "condition"),
    signal = TRUE
  ) {
    standardGeneric("signalCondition")       
  }
)

#' @title
#' Signal Custom Condition (\code{character-method})
#'
#' @description 
#' Signals custom conditions.
#' 
#' @details
#'   	The returned object will always inherit from class of object \code{condition}.
#' 		The value of \code{condition} will always be the first entry/entries of the  
#' 		object's class graph.  
#' 		Depending on the setting of \code{type}, it also inherits from 
#' 		either \code{message}, \code{warning}, \code{error} or \code{custom}.
#' 		If no value for \code{condition} is specified, then depending on the setting
#' 		of \code{type} respective default values are used: \code{"DefaultMessage"},
#' 		\code{"RappDefaultWarning"}, \code{"RappDefaultError"} and 
#' 		\code{"RappDefaultCondition"}.
#'   	
#' @template see-generic
#'     
#' @section Custom messages:
#'    When the first element in \code{msg} is unnamed, then it is regarded as 
#'    the messages's header which will be appended with \code{" //"}. Otherwise,
#'    message elements are regarded as name-value pairs that are displayed in
#'    the following format: \code{"* <name>: <value>"}.
#'    (e.g. \code{"* Line 1: hello world!"}).
#' 
#' @inheritParams signalCondition
#' @param condition \code{\link{character}}. Dimension: any.
#' 		Name(s) of the condition(s) that will be passed to the condition object's
#' 		class graph.  
#' @return Object of the class(es) that have been provided by \code{condition} and
#' 		also inheriting from \code{\link{condition}} and depending on
#' 		\code{type} also from \code{\link{message}}, \code{\link{warning}} or
#' 		\code{\link{error}}.
#' @example inst/examples/signalCondition.r
#' @seealso \code{
#'    \link[rapp.core.condition]{signalCondition}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "signalCondition", 
  signature = signature(
    condition = "character"
  ), 
  definition=function(
    condition,
    msg,
    ns,
    call,
    type,
    signal
  ) {
    
  ## Match arg //
  type <- match.arg(type, 
    c("message", "warning", "error", "condition")
  )
  
#   ns <- "rapp2"
  
  ## Message line break at end //
  if (length(msg)) {
    ## Ensure line break //
    msg <- sapply(msg, function(ii) {
      if (!length(grep("\\n$", ii, perl = TRUE))) {
        ii <- paste0(ii, "\n")    
      }     
    })
    if (length(msg) > 1) {
      if (is.null(names(msg[1])) || names(msg[1]) == "") {
        msg[1] <- gsub("\\n", " //\n", msg[1])
        start_line <- 2
      } else {
        start_line <- 1
      }
      msg[start_line:length(msg)] <- paste0(
          "[", seq(along = msg[start_line:length(msg)]), "] ", 
          "* ", names(msg[start_line:length(msg)]), ": ", 
          msg[start_line:length(msg)]
        )
    }
  } else {
    msg <- ""
  }
  
  ## Add call to message //
  msg <- c(
    paste0(Sys.time(), "/"),
    ifelse(!is.null(ns), paste0(ns, "/"), ""),
    ifelse(!is.null(call), paste0(call, "/"), ""),
    condition[1], "> \n", msg
  )
  msg <- paste(msg, collapse="")
  msg <- gsub("\\* : ", "", msg)
  
  ## Sub sub condition class //
  subsub <- switch(
    type,
    message = c(type, "condition"),
    warning = c(type, "condition"),
    error = c(type, "condition"),
    condition = "condition"
  )
  
  ## Create condition object //
  out <- structure(
    class = unique(c(condition, subsub)),
    list(message = msg, call = call)
  )
  if (signal) {
    switch(
      type,
      message = message(out),
      warning = warning(out),
      error = stop(out),
      condition = signalCondition(out)
    )    
  }
  
  ## Return //
  return(out)
    
  }
)

#' @title
#' Signal Custom Condition (\code{missing-method})
#'
#' @description 
#' Signals custom conditions.
#'
#' @details
#'   	The returned object will always inherit from class of object \code{condition}.
#' 		The value of \code{condition} will always be the first entry/entries of the  
#' 		object's class graph.  
#' 		Depending on the setting of \code{type}, it also inherits from 
#' 		either \code{message}, \code{warning}, \code{error} or \code{custom}.
#' 		If no value for \code{condition} is specified, then depending on the setting
#' 		of \code{type} respective default values are used: \code{"DefaultMessage"},
#' 		\code{"RappDefaultWarning"}, \code{"RappDefaultError"} and 
#' 		\code{"RappDefaultCondition"}.
#'   	
#' @template see-generic
#' 
#' @section Custom messages:
#'    When the first element in \code{msg} is unnamed, then it is regarded as 
#'    the messages's header which will be appended with \code{" //"}. Otherwise,
#'    message elements are regarded as name-value pairs that are displayed in
#'    the following format: \code{"* <name>: <value>"}.
#'    (e.g. \code{"* Line 1: hello world!"}).
#' 
#' @inheritParams signalCondition
#' @param condition \code{\link{missing}}.   
#' @return Object, depending on \code{type}, inheriting from 
#'    \code{\link{RappDefaultMessage}}, 
#'    \code{\link{RappDefaultWarning}} or \code{\link{RappDefaulError}} as well
#' 		as from \code{\link{message}}, \code{\link{warning}} or
#' 		\code{\link{error}} accordingly.
#' @example inst/examples/signalCondition.r
#' @seealso \code{
#'    \link[rapp.core.condition]{signalCondition}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "signalCondition", 
  signature = signature(
    condition = "missing"
  ), 
  definition = function(
    condition,
    msg,
    ns,
    call,
    type,
    signal
  ) {
    
  ## Match arg //
  type <- match.arg(type, 
    c("message", "warning", "error", "condition")
  )
  
  ## Default condition classes //
  if (missing(condition)) {
    condition <- switch(
      type,
      message = "RappDefaultMessage",
      warning = "RappDefaultWarning",
      error = "RappDefaultError",
      condition = "RappDefaultCondition"
    )    
  }
  
  ## Dispatch //
  out <- signalCondition(
    condition = condition,
    ns = ns,
    call = call,
    type = type,
    signal = signal
  )
  
  ## Return //
  return(out)
    
  }
)
