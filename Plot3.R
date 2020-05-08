#data read from the file
pdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#subset taken
pdata <- subset(pdata, pdata$Date == "1/2/2007" | pdata$Date == "2/2/2007")

#everything converted to required format as '?' denotes NA
pdata$Date <- as.Date(pdata$Date)
pdata$Time <- strptime(pdata$Time, format = "%H:%M:%S")
pdata[1:1440,"Time"] <- format(pdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
pdata[1441:2880,"Time"] <- format(pdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#everyday has 1440 minutes: 24*60
pdata$Global_active_power <- as.numeric(pdata$Global_active_power)
pdata$Global_reactive_power <- as.numeric(pdata$Global_reactive_power)
pdata$Voltage <- as.numeric(pdata$Voltage)
pdata$Global_intensity <- as.numeric(pdata$Global_intensity)
pdata$Sub_metering_1 <- as.numeric(pdata$Sub_metering_1)
pdata$Sub_metering_2 <- as.numeric(pdata$Sub_metering_2)
pdata$Sub_metering_3 <- as.numeric(pdata$Sub_metering_3)

png("Plot3.png", width =480, height = 480)
plot(pdata$Time, pdata$Sub_metering_1, type = "n", main = "Energy sub metering", xlab = "", ylab = "Energy sub metering")
lines(pdata$Time, pdata$Sub_metering_1, col = "red")
lines(pdata$Time, pdata$Sub_metering_2, col = "blue")
lines(pdata$Time, pdata$Sub_metering_3)
legend("topright", lty = c(1,1,1), col = c("red", "blue", "black"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()