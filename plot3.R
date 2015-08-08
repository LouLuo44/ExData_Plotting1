#Read in household_power_consumption.txt, subset to Feb 2007 and replicate plot3

#Getting data and subsetting to 1st and 2nd Feb 2007
#setwd("C:/Exploratory_Data_analysis/Project1")
housepower <- read.csv("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
library(lubridate)
housepower$Date <- dmy(housepower$Date)
house2007 <- subset(housepower, as.Date(Date) == "2007-02-01"| as.Date(Date) == "2007-02-02", select = Date:Sub_metering_3)
#Concatenate Date, Time fields
house2007$DateTime <- as.POSIXlt(paste(house2007$Date,house2007$Time),format="%Y-%m-%d %H:%M:%S")

#Create plot
png('plot3.png',width = 480, height = 480)
plot3 <- plot(house2007$DateTime, house2007$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
par(new=T)
plot3 <- plot(house2007$DateTime, house2007$Sub_metering_2, type = "l", axes = FALSE, ylim= c(0,38), xlab ="", ylab = "", col = "red")
par(new=T)
plot3 <- plot(house2007$DateTime, house2007$Sub_metering_3, type = "l", axes = FALSE, ylim= c(0,38), xlab ="", ylab = "", col = "blue")
legend("topright", lty= c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()