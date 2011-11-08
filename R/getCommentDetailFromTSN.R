# getCommentDetailFromTSN.R

getCommentDetailFromTSN <- 
# Args:
#   tsn: TSN for a taxonomic group (numeric)
# Output: A data.frame with results. 
# Examples:
#   getCommentDetailFromTSN(180543)

function(tsn = NA,
  url = 'http://www.itis.gov/ITISWebService/services/ITISService/getCommentDetailFromTSN',
  ..., 
  curl = getCurlHandle() ) 
{
  args <- list()
  if(!is.na(tsn))
    args$tsn <- tsn
  tt <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- xmlParse(tt)
  namespaces <- c(ax23="http://data.itis_service.itis.usgs.org/xsd")
  nodes <- getNodeSet(out, "//ax23:commentDetail", namespaces=namespaces)
  comment <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:commentId", namespaces=namespaces)
  commid <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:commentTimeStamp", namespaces=namespaces)
  commTime <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:commentator", namespaces=namespaces)
  commentator <- sapply(nodes, xmlValue)
  nodes <- getNodeSet(out, "//ax23:updateDate", namespaces=namespaces)
  updatedate <- sapply(nodes, xmlValue)
  data.frame(comment=comment, commid=commid, commTime=commTime, 
    commentator=commentator, updatedate=updatedate)
}

# http://www.itis.gov/ITISWebService/services/ITISService/getCommentDetailFromTSN?tsn=180543