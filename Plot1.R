## Installing libraries to manipulate data 
library(tidyr)
library(dplyr)
library(data.table)
library(lubridate)
library(reshape2)

# Create table
h_p_con <- tbl_df(read.csv("E:/OneDrive/Documents/Coursera/Data science/Working directory/household_power_consumption.txt"
                           , sep=";",stringsAsFactors=FALSE, na.strings ="?",dec = "." ))

h_p_con <- mutate(h_p_con,Date = dmy(h_p_con$Date), New_date = dmy_hms(paste(h_p_con$Date,h_p_con$Time))) 

h_p_con_feb <- filter(h_p_con ,Date >= "2007-02-01" & Date <= "2007-02-02")
## ------------------------------------------------------------------------------
## plot1.png 

png(filename = "plot1.png",width = 480, height = 480)
with(h_p_con_feb,hist(Global_active_power, col = "red",
                      main = "Global Active Power" , xlab =  "Global Active Power (kilowatts)" ))
dev.off()

