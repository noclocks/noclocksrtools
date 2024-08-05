if (FALSE) {
  # build a noclocks pkgdown site with extra reports:
  build_pkgdown_with_reports(
    pkg = ".",
    pkgdown_path = "public",
    assets_path = "pkgdown/assets",
    reports = c("testdown","coverage")
  )
}
