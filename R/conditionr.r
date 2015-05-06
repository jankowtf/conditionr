#' @title
#' Custom R Conditions
#'
#' @description
#' Allows the creation of custom condition classes and thus the
#' use of more complex/informative condition objects and messages for which
#' appropriate handler methods can be written.
#'
#' @details
#' The core functions/methods of this package:
#'  \itemize{
#'    \item{\code{\link[conditionr]{signalCondition}}: } {
#'
#'      Extends the features of \code{\link[base]{signalCondition}} in
#' 			order to generate custom condition objects for which handler
#' 			methods can be written.
#'    }
#'    \item{\code{\link[conditionr]{newMessage}}: } {
#'
#'      Convenience wrapper around \code{\link[conditionr]{signalCondition}}
#'      for facilitating the signaling of \emph{messages}
#'    }
#'    \item{\code{\link[conditionr]{newWarning}}: } {
#'
#'      Convenience wrapper around \code{\link[conditionr]{signalCondition}}
#'      for facilitating the signaling of \emph{warnings}
#'    }
#'    \item{\code{\link[conditionr]{newError}}: } {
#'
#'      Convenience wrapper around \code{\link[conditionr]{signalCondition}}
#'      for facilitating the signaling of \emph{errors}
#'    }
#'  }
#' @template author
#' @template references
#' @docType package
#' @name conditionr
NULL
