tc <- function(l) Filter(Negate(is.null), l)

argsnull <- function(x) {
  if (length(x) == 0) {
    NULL
  } else {
    x
  }
}

nmslwr <- function(x) {
  stats::setNames(x, tolower(names(x)))
}

itbase <- function() 'https://www.itis.gov/ITISWebService/services/ITISService/'
itjson <- function() 'https://www.itis.gov/ITISWebService/jsonservice/'
iturl <- function(x) {
  if (!tolower(x) %in% c('json', 'xml')) {
    stop("'wt' must be one of 'json' or 'xml'", call. = FALSE)
  }
  switch(
    x,
    json = itjson(),
    xml = itbase()
  )
}

`%-%` <- function(x, y) if (length(x) == 0 || nchar(x) == 0 || is.null(x)) y else x

dr_op <- function(x, y) {
  UseMethod("dr_op")
}

dr_op.default <- function(x, y) {
  return(NULL)
}

dr_op.data.frame <- function(x, y) {
  x[, !tolower(names(x)) %in% tolower(y)]
}

dr_op.list <- function(x, y) {
  x[!tolower(names(x)) %in% tolower(y)]
}

itis_GET <- function(endpt, args, wt, ...){
  args <- argsnull(args)
  cli <- crul::HttpClient$new(
    url = paste0(iturl(wt), endpt),
    opts = opts
  )
  tt <- cli$get(query = args)
  tt$raise_for_status()

  # sort out encoding - if not found, parse differently
  encoding <- NULL
  if (!is.null(tt$response_headers$`content-type`)) {
    encoding <- strsplit(
      strsplit(tt$response_headers$`content-type`, ";")[[1]][2],
      "="
    )[[1]][2]
  }
  if (is.null(encoding) || !nzchar(encoding)) {
    readBin(tt$content, character())
  } else {
    tt$parse(encoding)
  }
}

parse_raw <- function(x) {
  if ((inherits(x, "character") && !nzchar(x)) || is.na(x)) {
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
}

pick_cols.list <- function(x, nms) {
  if (NROW(x) > 0) {
    names(x) <- tolower(names(x))
    x[names(x) %in% tolower(nms)]
  } else {
    NULL
  }
}
