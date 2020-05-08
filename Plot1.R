#data read from the file
pdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#subset taken
pdata <- subset(pdata, pdata$Date == "1/2/2007" | pdata$Date == "2/2/2007")

#everything converted to required format as '?' denotes NA
pdata$Date <- as.Date(pdata$Date)
pdata$Time <- strptime(pdata$Time, format = "%H:%M:%S")
pdata$Global_active_power <- as.numeric(pdata$Global_active_power)
pdata$Global_reactive_power <- as.numeric(pdata$Global_reactive_power)
pdata$Voltage <- as.numeric(pdata$Voltage)
pdata$Global_intensity <- as.numeric(pdata$Global_intensity)
pdata$Sub_metering_1 <- as.numeric(pdata$Sub_metering_1)
pdata$Sub_metering_2 <- as.numeric(pdata$Sub_metering_2)
pdata$Sub_metering_3 <- as.numeric(pdata$Sub_metering_3)

#plot histogram
png("Plot1.png", width = 480, height = 480)
hist(pdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency")
dev.off()