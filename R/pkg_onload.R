
#  ------------------------------------------------------------------------
#
# Title : Package onLoad
#    By : Jimmy Briggs
#  Date : 2024-08-05
#
#  ------------------------------------------------------------------------

# onLoad ------------------------------------------------------------------

#' @keywords internal
#' @noRd
.onLoad <- function(
  libname = find.package("noclocksrtools"),
  pkgname = "noclocksrtools"
) {

  # globals -----------------------------------------------------------------
  .pkg_globals()

  # get options -------------------------------------------------------------
  .pkgenv$opts_reset <- options()
  # in .onUnload, we will reset these options

  # encryption key ----------------------------------------------------------
  key <- Sys.getenv("NOCLOCKS_ENCRYPTION_KEY")
  .pkgenv$encryption_key <- key

  # set options -------------------------------------------------------------
  .setopt("noclocks.useragent", .noclocks_user_agent())
  .setopt("noclocks.quiet", FALSE)
  .setopt("noclocks.verbose", FALSE)
  .setopt("noclocks.debug", FALSE)
  .setopt("noclocks.encryption_key", key)

  # load fonts --------------------------------------------------------------
  # .load_fonts()
  # sysfonts::font_add()

}

# onAttach ----------------------------------------------------------------

#' @keywords internal
#' @noRd
.onAttach <- function(
  libname = find.package("noclocksrtools"),
  pkgname = "noclocksrtools"
) {

  # get options -------------------------------------------------------------
  # .pkgenv$opts_reset <- options()
  # in .onUnload, we will reset these options

  # encryption key ----------------------------------------------------------
  # key <- Sys.getenv("NOCLOCKS_ENCRYPTION_KEY")
  # .pkgenv$encryption_key <- key

  # set options -------------------------------------------------------------
  # .setopt("noclocks.useragent", .noclocks_user_agent())
  # .setopt("noclocks.quiet", FALSE)
  # .setopt("noclocks.verbose", FALSE)
  # .setopt("noclocks.debug", FALSE)
  # .setopt("noclocks.encryption_key", key)

  # startup message ---------------------------------------------------------
  .pkg_startup_msg()

}

# onDetach ----------------------------------------------------------------

.onDetach <- function(libpath) {

  # reset options -----------------------------------------------------------
  # options(.pkgenv$reset_opts)

}


# onUnload ----------------------------------------------------------------

#' @keywords internal
#' @noRd
.onUnload <- function(libpath) {

  # reset options -----------------------------------------------------------
  # options(.pkgenv$reset_opts)

}

# startup message ---------------------------------------------------------

#' @keywords internal
#' @noRd
#' @importFrom utils packageVersion
#' @importFrom glue glue
.pkg_startup_msg <- function() {
  ver <- utils::packageVersion('noclocksrtools')
  glue::glue(
    .sep = "\n",
    "Welcome to the `noclocksrtools` package!",
    "This is version {ver}.",
    "Please refer to the package documentation for more information."
  ) |>
    packageStartupMessage()
}


# user agent --------------------------------------------------------------

#' @keywords internal
#' @noRd
#' @importFrom utils packageVersion
#' @importFrom glue glue
.noclocks_user_agent <- function() {
  platform <- .Platform$OS.type
  locale <- Sys.getlocale("LC_COLLATE")
  tz <- Sys.timezone()
  rver <- as.character(paste(R.version$major, R.version$minor, sep = "."))
  pkgver <- as.character(utils::packageVersion('noclocksrtools'))
  httr2ver <- as.character(utils::packageVersion('httr2'))
  rcurlver <- as.character(utils::packageVersion('curl'))
  syscurlver <- as.character(httr2:::curl_system_version())
  glue::glue(
    "noclocksrtools/{pkgver}",
    "httr2/{httr2ver}",
    "curl/{rcurlver}",
    "libcurl/{syscurlver}",
    "R/{rver}",
    "{platform} {locale} {tz}",
    .sep = " "
  )
}


# set options -------------------------------------------------------------

#' @keywords internal
#' @noRd
.setopt <- function(opt_name, opt_value, overwrite = TRUE) {

  curr_opt <- getOption(opt_name)

  if (is.null(curr_opt)) {
    .pkgenv$opts_reset[[opt_name]] <- NULL
    options(opt_name = opt_value)
    return(invisible(NULL))
  } else {
    if (curr_opt == opt_value) {
      .pkgenv$opts_reset[[opt_name]] <- curr_opt
      return(invisible(curr_opt))
    } else {
      if (overwrite) {
        .pkgenv$opts_reset[[opt_name]] <- curr_opt
        options(opt_name = opt_value)
        return(invisible(curr_opt))
      } else {
        return(invisible(curr_opt))
      }
    }
  }
}

