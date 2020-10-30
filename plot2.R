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
png("plot2.png", width=480, height=480)
with(subsetPowerConsumptionData, plot(dateTime, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()

