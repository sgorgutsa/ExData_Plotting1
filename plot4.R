#load data from file

filename <- "./household_power_consumption.txt"
RawData <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset, for required date range
SubsetData <- subset(RawData,RawData$Date=="1/2/2007" | RawData$Date =="2/2/2007")

#transform date-time representation
DateTime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

GlobalActivePower <- as.numeric(SubsetData$Global_active_power)
GlobalReactivePower <- as.numeric(SubsetData$Global_active_power)
Voltage <- as.numeric(SubsetData$Voltage)

SubMetering1 <- as.numeric(SubsetData$Sub_metering_1)
SubMetering2 <- as.numeric(SubsetData$Sub_metering_2)
SubMetering3 <- as.numeric(SubsetData$Sub_metering_3)

# open png output device, size set to 504x504 as original plots of this assignment
png("plot4.png", width=504, height=504)

par(mfrow = c(2, 2)) 
# 1 - plot, top-left
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power")

# 2 -plot, top-right
plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")

# 3 -plot, bottom-left
plot(DateTime, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DateTime, SubMetering2, type="l", col="red")
lines(DateTime, SubMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# 4 -plot, bottom-right
plot(DateTime, GlobalReactivePower, type="l", xlab="", ylab="Global Reactive Power")

#close ouput device
dev.off()