##Load libraries
library(lubridate)
library(dplyr)

## Read and clean data
electricity <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
subsetelectricity <- rbind(electricity[electricity$Date=="1/2/2007",], electricity[electricity$Date=="2/2/2007",])
subsetelectricity<-mutate(subsetelectricity, Timestamp = dmy_hms(paste(Date, Time)))
subsetelectricity <- subsetelectricity[,3:10]
subsetelectricity <- subsetelectricity[c(8, 1:7)]

##Plot on screen device
plot(subsetelectricity$Global_active_power~subsetelectricity$Timestamp, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

##Plot on PNG device
png(filename = "./plot2.png")
plot(subsetelectricity$Global_active_power~subsetelectricity$Timestamp, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
