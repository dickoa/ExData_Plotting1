consump <- read.table("data/household_power_consumption.txt",
                      na.strings = "?",
                      header = TRUE,
                      sep = ";",
                      dec = ".",
                      stringsAsFactors = FALSE)

str(consump)
consump$datetime <- paste(consump$Date, consump$Time)
consump$datetime <- strptime(consump$datetime, "%d/%m/%Y %H:%M:%S")
consump$Date <- as.Date(consump$Date, "%d/%m/%Y")



consump <- subset(consump,
                   Date <= as.Date("2007-02-02") &
                   Date >= as.Date("2007-02-01"))
str(consump)


png("figure/plot4.png", bg = "transparent")
par(mfrow = c(2, 2), mar = c(4, 4, 3.8, 1.8))
plot(consump$datetime,
     consump$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")


plot(consump$datetime,
     consump$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")


plot(consump$datetime,
     consump$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type = "l")
lines(consump$datetime,
     consump$Sub_metering_2,
     col = "red")
lines(consump$datetime,
     consump$Sub_metering_3,
     col = "blue")
legend("topright",
       legend = paste0("Sub_metering_", 1:3),
       col = c("black", "red", "blue"),
       lty = rep("solid", 3),
       bty = "n")


plot(consump$datetime,
     consump$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")
dev.off()
