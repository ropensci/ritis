itis_GET <- function(endpt, args, wt, ...){
  args <- argsnull(args)
  tt <- GET(paste0(iturl(wt), endpt), query = args, ...)
  #err_handle(tt)
  con_utf8(tt)
}

parse_raw <- function(wt, x) {
  switch(
    wt,
    json = fromJSON(x),
    xml = read_xml(x, encoding = "UTF-8")
  )
}

itis_parse <- function(a, b, d) {
  xpathfunc <- function(x, y, nsp) {
    xml_text(xml_find_all(y, paste0("//ax21:", x), nsp))
  }
  df <- setNames(data.frame(lapply(a, xpathfunc, y = b, nsp = d), stringsAsFactors = FALSE), a)
  nmslwr(df)
}

itisdf <- function(a, b, matches, colnames, pastens="ax21") {
  matches <- paste0(sprintf('//%s:', pastens), matches)
  output <- c()
  for (i in seq_along(matches)) {
    nodes <- xml_find_all(a, matches[[i]], b)
    output[[i]] <- xml_text(nodes)
  }
  if (length(unique(sapply(output, length))) == 1 && unique(sapply(output, length)) == 0) {
    data.frame(NULL, stringsAsFactors = FALSE)
  } else if (all(sapply(output, length) == 1)) {
    setNames(data.frame(t(output), stringsAsFactors = FALSE), colnames)
  } else {
    setNames(data.frame(output, stringsAsFactors = FALSE), colnames)
  }
}
