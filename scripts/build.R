system2("air", c("format", "."))
styler::style_pkg(filetype = c("Rmd")) # Air currently doesn't format .Rmd files
lintr::lint_package(
  linters = lintr::linters_with_defaults(
    line_length_linter = lintr::line_length_linter(1000),
    object_name_linter = lintr::object_name_linter(regexes = ".*")
  )
)

roxygen2md::roxygen2md()
devtools::document()

devtools::build_readme()

# Note: Only use pkgdown to build a documentation website for public facing packages
pkgdown::build_home()
pkgdown::build_reference()
pkgdown::build_site()
browseURL("docs/index.html")

devtools::test()
devtools::check()

# Test files that have less then 100% coverage
covr:::tally_coverage(covr::package_coverage()) |>
  dplyr::summarize(
    percent_coverage = mean(value > 0) * 100,
    .by = filename
  ) |>
  dplyr::filter(percent_coverage < 100) |>
  dplyr::arrange(percent_coverage)

# Report for all test files
covr::report(covr::package_coverage())
