#load data from file

filename <- "./household_power_consumption.txt"
RawData <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset, for required date range
SubsetData <- subset(RawData,RawData$Date=="1/2/2007" | RawData$Date =="2/2/2007")

GlobalActivePower <- as.numeric(SubsetData$Global_active_power)

#transform date-time representation

DateTime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# open png output device, size set to 504x504 as original plots of this assignment
png("plot2.png", width=504, height=504)
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#close ouput device
dev.off()