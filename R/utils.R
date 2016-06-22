itis_GET <- function(endpt, args, wt, ...){
  args <- argsnull(args)
  tt <- httr::GET(paste0(iturl(wt), endpt), query = args, ...)
  httr::stop_for_status(tt)
  #err_handle(tt)
  con_utf8(tt)
}

parse_raw <- function(x) jsonlite::fromJSON(x, flatten = TRUE)
  # switch(
  #   wt,
  #   json = jsonlite::fromJSON(x, flatten = TRUE),
  #   xml = xml2::read_xml(x, encoding = "UTF-8")
  # )
# }

pick_cols <- function(x, nms) {
  names(x) <- tolower(names(x))
  x[, names(x) %in% tolower(nms)]
}
