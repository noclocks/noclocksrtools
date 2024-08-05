
#  ------------------------------------------------------------------------
#
# Title : Package Options
#    By : Jimmy Briggs
#  Date : 2024-08-05
#
#  ------------------------------------------------------------------------

# internal ----------------------------------------------------------------

# utility -----------------------------------------------------------------

# package options ---------------------------------------------------------

# initialize package options
.pkgenv$options$init <- function() {
  # initialize package options
  options(noclocksrtools.encryption_key = NULL)
}

#' Get Options
#'
#' @description
#' Get package options
#'
#' @param opts A character vector of option names to get. Default is `NULL`,
#'   and if left `NULL`, will return all available package options included
#'   in `noclocksrtools`.
#'
#' @return A named list of package options
#'
#' @export
#'
#' @examples
#' get_opts()
get_opts <- function(opts = NULL) {
  if (is.null(opts)) {
    opt_names <- grep("^noclocks\\.", names(options()), value = TRUE)
    opts <- sapply(opt_names, function(x) {
      x <- gsub("^noclocks\\.", "", x)
      x <- gsub("\\.", "_", x)
      x
    })
    names(opts) <- opt_names
  } else {
    opts <- grep("^noclocks\\.", opts, value = TRUE)
    opts <- sapply(opts, function(x) {
      x <- gsub("^noclocks\\.", "", x)
      x <- gsub("\\.", "_", x)
      x
    })
  }

  return(opts)

}

