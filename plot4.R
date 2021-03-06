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
par(mfrow = c(2,2))
plot(subsetelectricity$Global_active_power~subsetelectricity$Timestamp, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(subsetelectricity$Voltage~subsetelectricity$Timestamp, type="l", xlab = "datetime", ylab = "Voltage")
plot(subsetelectricity$Sub_metering_1~subsetelectricity$Timestamp, type="l", xlab = "", ylab = "Energy sub metering")
lines(subsetelectricity$Sub_metering_2~subsetelectricity$Timestamp, col="red")
lines(subsetelectricity$Sub_metering_3~subsetelectricity$Timestamp, col="blue")
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(subsetelectricity$Global_reactive_power~subsetelectricity$Timestamp, type="l", xlab = "datetime", ylab = "Global_reactive_power")

##Plot on PNG device
png(filename = "./plot4.png")
par(mfrow = c(2,2))
plot(subsetelectricity$Global_active_power~subsetelectricity$Timestamp, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(subsetelectricity$Voltage~subsetelectricity$Timestamp, type="l", xlab = "datetime", ylab = "Voltage")
plot(subsetelectricity$Sub_metering_1~subsetelectricity$Timestamp, type="l", xlab = "", ylab = "Energy sub metering")
lines(subsetelectricity$Sub_metering_2~subsetelectricity$Timestamp, col="red")
lines(subsetelectricity$Sub_metering_3~subsetelectricity$Timestamp, col="blue")
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(subsetelectricity$Global_reactive_power~subsetelectricity$Timestamp, type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
