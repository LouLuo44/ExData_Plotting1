#Read in household_power_consumption.txt, subset to Feb 2007 and replicate plot2

#Getting data and subsetting to 1st and 2nd Feb 2007
#setwd("C:/Exploratory_Data_analysis/Project1")
housepower <- read.csv("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
library(lubridate)
housepower$Date <- dmy(housepower$Date)
house2007 <- subset(housepower, as.Date(Date) == "2007-02-01"| as.Date(Date) == "2007-02-02", select = Date:Sub_metering_3)
#Concatenate Date, Time fields
house2007$DateTime <- as.POSIXlt(paste(house2007$Date,house2007$Time),format="%Y-%m-%d %H:%M:%S")

#Create plot
png('plot2.png',width = 480, height = 480)
plot(house2007$DateTime, house2007$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()