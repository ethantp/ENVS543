#' 
#' A function to get data from the example Rice Rivers Center used in class
#' This function downloads the data from the provided URL, processes the data 
#' to include proper date and time objects with common units, with additional 
#' date-time related columns, and also removes unessessary columns not needed
#' for final analysis.
#'

get_rice_data <- function() {
  # load in required apps
  library(dplyr)  
  library(lubridate)
  # read in data from URL
  url <- "https://docs.google.com/spreadsheets/d/1Mk1YGH9LqjF7drJE-td1G_JkdADOU0eMlrP01WFBT8s/pub?gid=0&single=true&output=csv"
  data <- read.csv(url, stringsAsFactors = FALSE)
  # Recognize the structure of the DateTime column
  data$DateTime <- as.POSIXct(data$DateTime,
                              format = "%m/%d/%Y %H:%M:%S")
  # Extracting data from the DateTime column
  data$Date <- as.Date(data$DateTime)  # creates separate date column
  data$Month <- factor(month(data$DateTime), # factors dates into month values
                       levels = 1:12, # number of months
                       labels = month.name) # Displays the rows as month name
  data$Day <- day(data$DateTime) # creates separate day column from DateTime
  data$Weekday <- factor(weekdays(data$DateTime), # create weekday column
                         levels = c("Monday", # defines values based on the calendar days
                                    "Tuesday",
                                    "Wednesday",
                                    "Thursday",
                                    "Friday",
                                    "Saturday",
                                    "Sunday"))
  data$Time <- format(data$DateTime, "%H:%M") # create time table from the DateTime format
  # Removing DateTime and RecordID columns
  data <- data %>% select(-DateTime, -RecordID) # DateTime was displayed again,
  # RecordID is likely the least useful to the analysis.
}


