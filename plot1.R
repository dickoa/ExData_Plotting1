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

png("figure/plot1.png", bg = "transparent")
hist(consump$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Acative Power")
dev.off()
