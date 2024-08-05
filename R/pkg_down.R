
#  ------------------------------------------------------------------------
#
# Title : Package Documentation via `pkgdown`
#    By : Jimmy Briggs
#  Date : 2024-08-05
#
#  ------------------------------------------------------------------------


# build -------------------------------------------------------------------

#' No Clocks `pkgdown`
#'
#' @description
#' Build a [pkgdown::pkgdown()] site with additional options to include
#' extra reports.
#'
#' The reports that can be included are:
#'   - Test Results Report via [testdown::test_down()]
#'   - Test Coverage Results via [covrpage::covrpage()]
#'   - Git Reports via [gitdown::git_down()]
#'
#' @param pkg (character) Path to the package in development
#' @param pkgdown_path (character) Relative path inside the package to store
#'   the final `pkgdown` site
#' @param assets_path (character) Relative path within the package to store
#'   the `pkgdown` assets
#' @param reports (character) Vector of reports to be produced. Must be a subset
#'   of `c("testdown","gitdown", "coverage")`. The default is
#'   `c("coverage", "testdown", "gitdown")`.
#' @param git_branch_ref (character) Git branch to use. `main' by default
#' @param overwrite_assets (logical) Whether the assets directory should be
#'   overwritten. Default is `TRUE`.
#' @param ... Additional arguments to pass to `pkgdown::build_site()`
#'
#' @return A `pkgdown` site in the specified `pkgdown_path` directory
#'
#' @export
#'
#' @importFrom fs dir_create file_move
#' @importFrom pkgdown build_site
#' @importFrom covr package_coverage report
#' @importFrom covrpage covrpage
#' @importFrom testdown test_down
#' @importFrom gitdown git_down
#' @importFrom markdown markdownToHTML
#' @importFrom jsonlite fromJSON
#' @importFrom glue glue
#'
#' @example examples/ex_pkgdown.R
build_pkgdown <- function(
  pkg,
  pkgdown_path = "pkgdown",
  assets_path = "pkgdown/assets",
  reports = c("coverage", "testdown", "gitdown"),
  git_branch_ref = "main",
  overwrite_assets = TRUE,
  ...
) {

  reports <- rlang::arg_match(reports, multiple = TRUE)

  if (isTRUE(overwrite)) { unlink(file.path(pkg, assets_path), recursive = TRUE) }

  # initialize navbar report
  menu <- list()
  if (length(reports) != 0) {
    fs::dir_create(file.path(pkg, assets_path))
  }

  # generate covr report in a tmp folder and move it to assets path
  if (isTRUE("coverage" %in% reports)) {
    if (!requireNamespace("covr", quietly = TRUE)) {
      stop(
        "{covr} needs to be installed"
      )
    }
    if (!requireNamespace("DT", quietly = TRUE)) {
      stop(
        "{DT} needs to be installed"
      )
    }
    if (!requireNamespace("htmltools", quietly = TRUE)) {
      stop(
        "{htmltools} needs to be installed"
      )
    }
    if (!requireNamespace("markdown", quietly = TRUE)) {
      stop(
        "{markdown} needs to be installed"
      )
    }
    covr_pkg <- covr::package_coverage(
      path = pkg,
      install_path = file.path(pkg, "covr")
    )
    covr::report(
      x = covr_pkg,
      file = file.path(assets_path, "coverage", "coverage.html"),
      browse = FALSE
    )

    # file_move(file.path(pkg, "coverage"), file.path(assets_path, "coverage"))
    menu[[length(menu) + 1]] <- list(text = "coverage", href = "coverage/coverage.html")
    # Add coverage explanation
    markdown::markdownToHTML(
      file = system.file(
        "templates/markdown/coverage_report_explanation.md",
        package = "noclocksr"
      ),
      output = file.path(assets_path, "coverage", "codecoverage_explanation.html")
    )
    menu[[length(menu) + 1]] <- list(
      text = "coverage explained",
      href = "coverage/codecoverage_explanation.html"
    )
  }

  # generate testdown report in assets path
  if (isTRUE("testdown" %in% reports)) {
    if (!requireNamespace("testdown", quietly = TRUE)) {
      stop(
        "{testdown} needs to be installed"
      )
    }

    testdown::test_down(
      pkg = pkg,
      book_path = file.path(assets_path, "testdown"),
      open = FALSE
    )
    menu[[length(menu) + 1]] <- list(text = "testdown", href = "testdown/index.html")
  }

  # generate gitdown report in assets path
  if (isTRUE("gitdown" %in% reports)) {
    if (!requireNamespace("gitdown", quietly = TRUE)) {
      stop(
        "{gitdown} needs to be installed"
      )
    }

    gitdown::git_down(
      repo = pkg,
      book_path = file.path(assets_path, "gitdown"),
      ref = git_branch_ref,
      open = FALSE
    )
    homepage <- file.path(
      "gitdown",
      list.files(
        pattern = "^gitbook-for",
        file.path(assets_path, "gitdown")
      )[1]
    )
    menu[[length(menu) + 1]] <- list(text = "gitdown", href = homepage)
  }

  # prepare yaml settings to add reports in navbar
  yaml_settings <- list(
    destination = pkgdown_path,
    template = list(
      assets = assets_path
    ),
    navbar = list(
      structure = list(
        left = c("intro", "reference", "articles", "tutorials", "news", "reports")
      ),
      components = list(
        reports = list(
          text = "Reports",
          menu = menu
        )
      )
    )
  )

  # build site without preview
  pkgdown::build_site(
    pkg = pkg,
    override = yaml_settings,
    preview = FALSE,
    devel = TRUE,
    install = FALSE,
    new_process = TRUE,
    ...
  )


}
