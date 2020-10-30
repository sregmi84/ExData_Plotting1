library(data.table)

###Set working directory to relevant folder with the Data sub-folder containing the Power Consumption Data
#setwd()

###Read data
powerConsumptionData <- fread("./Data/household_power_consumption.txt",na.strings = "?")
#head(powerConsumptionData,n=2)
#str(powerConsumptionData)

###Convert Date
powerConsumptionData$Date <- as.Date(powerConsumptionData$Date, format="%d/%m/%Y")

###Subset Data to Relevant Dates
subsetPowerConsumptionData <- subset(powerConsumptionData,powerConsumptionData$Date >= "2007-02-01" & powerConsumptionData$Date <= "2007-02-02")
#table(subsetPowerConsumptionData$Date)

###Plot Histogram
png("plot1.png", width=480, height=480)
hist(subsetPowerConsumptionData$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
