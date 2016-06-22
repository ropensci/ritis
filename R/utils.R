itis_GET <- function(endpt, args, wt, ...){
  args <- argsnull(args)
  tt <- httr::GET(paste0(iturl(wt), endpt), query = args, ...)
  httr::stop_for_status(tt)
  #err_handle(tt)
  con_utf8(tt)
}

parse_raw <- function(x) {
  if (inherits(x, "character") && !nzchar(x)) {
    return(tibble::as_data_frame())
  }
  jsonlite::fromJSON(x, flatten = TRUE)
}

pick_cols <- function(x, nms) {
  UseMethod("pick_cols")
}

pick_cols.default <- function(x, nms) {
  return(NULL)
}

pick_cols.data.frame <- function(x, nms) {
  if (NROW(x) > 0) {
    names(x) <- tolower(names(x))
    x[, names(x) %in% tolower(nms)]
  } else {
    NULL
  }
  # if (inherits(x, "data.frame")) {
  #   if (NROW(x) > 0) {
  #     names(x) <- tolower(names(x))
  #     x[, names(x) %in% tolower(nms)]
  #   } else {
  #     NULL
  #   }
  # } else {
  #   NULL
  # }
}

pick_cols.list <- function(x, nms) {
  if (NROW(x) > 0) {
    names(x) <- tolower(names(x))
    x[names(x) %in% tolower(nms)]
  } else {
    NULL
  }
}
