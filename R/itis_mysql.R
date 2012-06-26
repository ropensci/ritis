#################################################
#######   Read from SQL   #######
#################################################
# require(RMySQL); require(plyr)
# 
# drv <- dbDriver("MySQL") # set the database to MySQL
# con <- dbConnect(drv, user = "root", dbname = "ITIS", host = "localhost") # set your credentials

###### Example queries
# g1 <- dbGetQuery(con, "SELECT comment_detail FROM comments WHERE commentator='J. D. Hardy'") 
# dbListFields(con, "comments")
# splist <- dbGetQuery(con, "SELECT DISTINCT col_11 FROM dat")
