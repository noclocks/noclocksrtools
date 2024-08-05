
#  ------------------------------------------------------------------------
#
# Title : noclocksrtools - Package Development
#    By : Jimmy Briggs
#  Date : 2024-08-05
#
#  ------------------------------------------------------------------------


# library -----------------------------------------------------------------

require(usethis)


# initialize --------------------------------------------------------------

usethis::create_package("noclocksrtools")

usethis::use_build_ignore("dev")
usethis::use_build_ignore("examples")
usethis::use_build_ignore("tools")

usethis::use_author(
  "Jimmy", "Briggs",
  role = c("aut", "cre"),
  email = "jimmy.briggs@noclocks.dev",
  comment = c(ORCID = "0000-0002-7489-8787")
)
usethis::use_author(
  "Patrick", "Howard",
  role = c("aut", "rev"),
  email = "patrick.howard@noclocks.dev",
  comment = c(ORCID = "0000-0000-0000-0000")
)
usethis::use_author(
  "No Clocks, LLC",
  role = c("fnd", "cph"),
  email = "dev@noclocks.dev"
)
desc::desc_normalize()
