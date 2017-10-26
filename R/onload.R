conn_itis <- NULL
.onLoad <- function(libname, pkgname){
	x <- solrium::SolrClient$new(host = "services.itis.gov",
		scheme = "https", port = NULL, errors = "complete")
  conn_itis <<- x
}
