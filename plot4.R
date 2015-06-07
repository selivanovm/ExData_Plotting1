library(dplyr)
library(lubridate)

Sys.setlocale(category = "LC_TIME", locale = "en_US.utf8")
rawData <- read.csv(file = "household_power_consumption.txt", sep = ";", na.strings = "?", as.is = c(1, 2))
data <- filter(rawData, grepl("^([1|2]/2/2007)", Date) & !is.na(Global_active_power))
data <- mutate(data, dateTime = dmy_hms(paste(Date, Time, sep = ";")))

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

#Plot 1
plot(x = range(data$dateTime), y = range(data$Global_active_power),
     type = "n",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     cex.lab = 0.8,
     cex.axis = 0.8)
lines(x = data$dateTime, y = data$Global_active_power)

#Plot 2
plot(x = range(data$dateTime), y = range(data$Voltage),
     type = "n",
     xlab = "datetime",
     ylab = "Voltage",
     cex.lab = 0.8,
     cex.axis = 0.8)
lines(x = data$dateTime, y = data$Voltage)

#Plot 3
plot(x = range(data$dateTime), y = range(data$Sub_metering_1),
     type = "n",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     cex.lab = 0.8,
     cex.axis = 0.8)

lines(x = data$dateTime, y = data$Sub_metering_1, col = 1)
lines(x = data$dateTime, y = data$Sub_metering_2, col = 2)
lines(x = data$dateTime, y = data$Sub_metering_3, col = 4)

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), 
       lwd = c(1, 1, 1),
       col = c(1, 2, 4),
       bty = "n")

#Plot 4
plot(x = range(data$dateTime), y = range(data$Global_reactive_power),
     type = "n",
     xlab = "datetime",
     ylab = "Global_reactive_power",
     cex.lab = 0.8,
     cex.axis = 0.8)
lines(x = data$dateTime, y = data$Global_reactive_power)

dev.off()

