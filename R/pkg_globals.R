
#  ------------------------------------------------------------------------
#
# Title : Package Globals
#    By : Jimmy Briggs
#  Date : 2024-08-05
#
#  ------------------------------------------------------------------------

# internal ----------------------------------------------------------------

#' @keywords internal
#' @noRd
#' @importFrom utils globalVariables
.pkg_globals <- function() {
  if (getRversion() >= "2.15.1") {
    utils::globalVariables(c(
      # PACKAGE GLOBALS #
    ))
  }
}
