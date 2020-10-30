library(data.table)

###Set working directory to relevant folder with the Data sub-folder containing the Power Consumption Data
#setwd()

###Read data
powerConsumptionData <- fread("./Data/household_power_consumption.txt",na.strings = "?")
#head(powerConsumptionData,n=2)
#str(powerConsumptionData)

###Create column in table with date and time merged together
dateTime <- strptime(paste(powerConsumptionData$Date, powerConsumptionData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
powerConsumptionData <- cbind(powerConsumptionData, dateTime)
#head(powerConsumptionData,n=2)

###Convert Date
powerConsumptionData$Date <- as.Date(powerConsumptionData$Date, format="%d/%m/%Y")

###Subset Data to Relevant Dates
subsetPowerConsumptionData <- subset(powerConsumptionData,powerConsumptionData$Date >= "2007-02-01" & powerConsumptionData$Date <= "2007-02-02")
#table(subsetPowerConsumptionData$Date)

###Plot
png("plot3.png", width=480, height=480)
with(subsetPowerConsumptionData, plot(dateTime, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(subsetPowerConsumptionData$dateTime, subsetPowerConsumptionData$Sub_metering_2,type="l", col= "red")
lines(subsetPowerConsumptionData$dateTime, subsetPowerConsumptionData$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()

