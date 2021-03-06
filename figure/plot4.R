ds <- read.table("household_power_consumption.txt", sep=";", header=TRUE, skip=66636, nrow=2880, stringsAsFactor=FALSE, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
ds$Time <- strptime(paste(ds$Date,ds$Time), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot (ds$Time, ds$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot (ds$Time, ds$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot (ds$Time, ds$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(ds$Time, ds$Sub_metering_2, type="l", col="red")
lines(ds$Time, ds$Sub_metering_3, type="l", col="blue")
legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=1, col=c("black", "red", "blue"))
plot (ds$Time, ds$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
