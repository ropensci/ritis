sm <- function(x) suppressMessages(x)

# set up vcr
library("vcr")
invisible(vcr::vcr_configure(dir = "../fixtures"))
