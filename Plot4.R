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
## plot 4
png(filename = "plot4.png",width = 480, height = 480)

par(mfrow = c(2,2))
#subplot 4.1
with(h_p_con_feb,plot(New_date,Global_active_power,type = "l",xlab ="", ylab =  "Global Active Power (kilowatts)"))

## subplot 4.2
with(h_p_con_feb,plot(New_date, Voltage ,type = "l",xlab ="datetime"))

## subplot 4.3
with (h_p_con_feb,plot(New_date,Sub_metering_1,type = "n",ylim = range(Sub_metering_1,Sub_metering_2,Sub_metering_3),
                       xlab ="", ylab =  "Energy sub metering"))
with(h_p_con_feb,lines(New_date,Sub_metering_1,type = "l",ylim = range(Sub_metering_1,Sub_metering_2,Sub_metering_3)))
with(h_p_con_feb,lines(New_date,Sub_metering_2,type = "l", col="red",ylim = range(Sub_metering_1,Sub_metering_2,Sub_metering_3)))

with(h_p_con_feb,lines(New_date,Sub_metering_3,type = "l", col = "blue",ylim = range(Sub_metering_1,Sub_metering_2,Sub_metering_3)))
legend("topright", lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col =c("black","red","blue"))

## subplot 4.4 
with(h_p_con_feb,plot(New_date,Global_reactive_power,type = "l",xlab ="datetime"))
dev.off()