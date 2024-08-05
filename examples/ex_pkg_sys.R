# pkg_sys examples

# Access the package DESCRIPTION file
pkg_sys("DESCRIPTION")

# Access the package NAMESPACE file
pkg_sys("NAMESPACE")

# Access External Data
pkg_sys("extdata", "data.csv")
# or
pkg_sys_extdata("data.csv")

# Access Assets
pkg_sys("assets", "images", "logo.png")
# or
pkg_sys_assets("images", "logo.png")
# or
pkg_sys_img("logo.png")
