
#  ------------------------------------------------------------------------
#
# Title : Package System Resources
#    By : Jimmy Briggs
#  Date : 2024-08-05
#
#  ------------------------------------------------------------------------


# internal ----------------------------------------------------------------

.pkg_assets <- function() {
  list(
    "images" = list(
      "logos" = "images/logos",
      "icons" = "images/icons",
      "banners" = "images/banners",
      "favicons" = "images/favicons",
      "team" = "images/team"
    ),
    "scripts" = list(
      "js" = "scripts/js",
      "ts" = "scripts/ts"
    ),
    "styles" = list(
      "css" = "styles/css",
      "scss" = "styles/scss"
    ),
    "fonts" = list(
      "inter" = "fonts/Inter",
      "roboto" = "fonts/Roboto",
      "fira" = "fonts/FiraCode"
    ),
    "html" = list(
      "templates" = "html/templates",
      "partials" = "html/partials",
      "layouts" = "html/layouts"
    ),
    "animations" = "animations"
  )

}

# system_file -------------------------------------------------------------

#' System File
#'
#' @description
#' This function is actually a [purrr::partial()] which re-implements
#' [base::system.file()] to be pre-configured to access files from this
#' package: `noclocksrtools`.
#'
#' @inheritParams .pkg_sys_params
#'
#' @section Implementation:
#' This function is implemented using [purrr::partial()] to create a partial
#' function which wraps [base::system.file()] and sets the `package` argument
#' to `noclocksrtools`.
#'
#' @seealso
#' - [pkg_sys()]
#' - [purrr::partial()]
#' - [base::system.file()], [fs::path_package()]
#'
#' @export
#'
#' @inherit .pkg_sys_returns return
#'
#' @keywords internal
#'
#' @family Package Utilities
#'
#' @importFrom purrr partial
system_file <- purrr::partial(.f = system.file, package = "noclocksrtools")


# pkg_sys -----------------------------------------------------------------

#' Package System File
#'
#' @name pkg_sys
#'
#' @description
#' This function is used to access system files within the package and wraps
#' [base::system.file()] to provide a more convenient interface for accessing
#' and retrieving installed package system files and resources.
#'
#' @inheritParams .pkg_sys_params
#'
#' @export
#'
#' @seealso
#' - [system_file()], [pkg_docs()], [pkg_manual()]
#' - [base::system.file()], [fs::path_package()]
#'
#' @inherit .pkg_sys_returns return
#'
#' @inheritSection pkg_sys_ext Extensions
#'
#' @export
#'
#' @example examples/ex_pkg_sys.R
pkg_sys <- function(...) {
  system.file(..., package = "noclocksrtools", mustWork = TRUE)
}

# extensions --------------------------------------------------------------

#' @title Package System Extensions
#'
#' @name pkg_sys_ext
#'
#' @section Extensions:
#'
#' `noclocksrtools` also includes a variety of convenience *extension function*
#' which wrap `pkg_sys()` to access specific directories or types of package
#' resources.
#'
#' ## External Data
#'
#' - `pkg_sys_extdata()`: Access package data files in the `extdata/` external data folder.
#'
#' ## Templates
#'
#' - `pkg_sys_templates()`: Access package templates in the `inst/templates` folder.
#'
#' ## Scripts
#'
#' - `pkg_sys_scripts()`: Access package scripts in the `inst/scripts` folder.
#'
#' ## Configuration
#'
#' - `pkg_sys_config()`: Access package configuration files in the `inst/config` folder.
#'
#' ## Documentation
#'
#' - `pkg_sys_docs()`: Access package documentation files in the `inst/docs` folder.
#'
#' There is also the functions [pkg_docs()] and [pkg_manual()] which launch
#' the package's locally installed documentation website (via `pkgdown`) and
#' its manual PDF, respectively.
#'
#' ## Examples
#'
#' - `pkg_sys_examples()`: Access package example files in the `inst/examples` folder.
#'
#' ## Assets
#'
#' - `pkg_sys_assets()`: Access package assets included in the `assets/` folder.
NULL

#' @rdname pkg_sys
#' @export
pkg_sys_assets <- function(..., pkg = "noclocksrtools") {
  pkg_sys("assets", ..., pkg = pkg)
}

#' @rdname pkg_sys
#' @export
pkg_sys_img <- function(..., pkg = "noclocksrtools") {
  pkg_sys("assets", "images", ..., pkg = pkg)
}

#' @rdname pkg_sys
#' @export
pkg_sys_scripts <- function(..., pkg = "noclocksrtools") {
  pkg_sys("assets", "scripts", ..., pkg = pkg)
}

#' @rdname pkg_sys
#' @export
pkg_sys_js <- pkg_sys_scripts

#' @rdname pkg_sys
#' @export
pkg_sys_styles <- function(..., pkg = "noclocksrtools") {
  pkg_sys("assets", "styles", ..., pkg = pkg)
}

#' @rdname pkg_sys
#' @export
pkg_sys_css <- function(..., pkg = "noclocksrtools") {
  pkg_sys("assets", "styles", "css", ..., pkg = pkg)
}

#' @rdname pkg_sys
#' @export
pkg_sys_scss <- function(..., pkg = "noclocksrtools") {
  pkg_sys("assets", "styles", "scss", ..., pkg = pkg)
}

#' @rdname pkg_sys
#' @export
pkg_sys_fonts <- function(..., pkg = "noclocksrtools") {
  pkg_sys("assets", "fonts", ..., pkg = pkg)
}

#' @rdname pkg_sys
#' @export
pkg_sys_logos <- function(..., pkg = "noclocksrtools") {
  pkg_sys("assets", "logos", ..., pkg = pkg)
}

#' @rdname pkg_sys
#' @export
pkg_sys_config <- function(..., pkg = "noclocksrtools") {
  pkg_sys("config", ..., pkg = pkg)
}

#' @rdname pkg_sys
#' @export
pkg_sys_extdata <- function(..., pkg = "noclocksrtools") {
  pkg_sys("extdata", ..., pkg = pkg)
}

#' @rdname pkg_sys
#' @export
pkg_sys_examples <- function(..., pkg = "noclocksrtools") {
  pkg_sys("examples", ..., pkg = pkg)
}

#' @rdname pkg_sys
#' @export
pkg_sys_templates <- function(..., pkg = "noclocksrtools") {
  pkg_sys("templates", ..., pkg = pkg)
}



