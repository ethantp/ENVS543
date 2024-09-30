
getRiceData <- function() {
  
  
}

library( tidyverse )




url <- "https://docs.google.com/spreadsheets/d/1Mk1YGH9LqjF7drJE-td1G_JkdADOU0eMlrP01WFBT8s/pub?gid=0&single=true&output=csv"

read.csv( url ) -> rice

#make data object
#make month & weekday object
#get rid of extra data
#reorder the columns

#return( rice )

if("date" %in% colnames(rice)) {
  rice$date <- as.Date(rice$date, format="%Y-%m-%d")
}



