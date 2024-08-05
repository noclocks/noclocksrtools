
#  ------------------------------------------------------------------------
#
# Title : Shared Roxygen
#    By : Jimmy Briggs
#  Date : 2024-08-05
#
#  ------------------------------------------------------------------------

# parameters --------------------------------------------------------------

#' Shared Parameters
#'
#' @name .roxy_params
#'
#' @description
#' Reused parameter definitions are gathered here for easier editing.
#'
#' @param req An API request object represented via [httr2::request()].
#' @param res An API response object represented via [httr2::response()].
#'
#' @param input,output,session R Shiny Server default function parameters.
#'
#' @param pkg Character representing the package name.
#'
#' @param path Character path to the file or directory.
#'
#' @param id Character representing the unique identifier.
#'
#' @param data `data.frame` or `tibble` object.
#'
#' @param verbose Logical indicating if verbose output should be printed.
#' @param quiet Logical indicating if output should be suppressed.
#'
#' @param ... Additional parameters passed to the function.
#'
#' @keywords internal
#'
#' @noRd
NULL


# returns -----------------------------------------------------------------

#' Shared Return for an API Request Object
#'
#' @name .roxy_return_api_req
#'
#' @return API request object return from [httr2::request()].
#'
#' @keywords internal
#'
#' @noRd
NULL


#' Shared Return for an API Response Object
#'
#' @name .roxy_return_api_resp
#'
#' @return API response object return from [httr2::response()].
#'
#' @keywords internal
#'
#' @noRd
NULL

# pkg_sys -----------------------------------------------------------------

#' Re-Used Parameters for Package System Functions
#'
#' @name .pkg_sys_params
#' @keywords internal
#'
#' @param ... A character vector of path components passed to [base::system.file()].
#' @param pkg (Optional) The package name used to access the system files for.
#'
#' @noRd
NULL


#' Re-Used Return Values for Package System Functions
#'
#' @name .pkg_sys_returns
#' @keywords internal
#'
#' @return Character path to the specified system file.
#'
#' @noRd
NULL
