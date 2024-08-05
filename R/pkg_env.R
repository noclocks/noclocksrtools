
#  ------------------------------------------------------------------------
#
# Title : Package Environment
#    By : Jimmy Briggs
#  Date : 2024-08-05
#
#  ------------------------------------------------------------------------

# initialize package environment
.pkgenv <- new.env(parent = emptyenv())

# initialize environment variables
.pkgenv$init <- FALSE
.pkgenv$options <- list()
.pkgenv$globals <- list()

.pkgenv$encryption_key <- NULL
