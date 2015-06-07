library(dplyr)
library(lubridate)

Sys.setlocale(category = "LC_TIME", locale = "en_US.utf8")
rawData <- read.csv(file = "household_power_consumption.txt", sep = ";", na.strings = "?", as.is = c(1, 2))
data <- filter(rawData, grepl("^([1|2]/2/2007)", Date) & !is.na(Global_active_power))
data <- mutate(data, dateTime = dmy_hms(paste(Date, Time, sep = ";")))
plot(x = data$dateTime, y = data$Global_active_power,
     type = "n",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     cex.lab = 0.8,
     cex.axis = 0.8)
lines(x = data$dateTime, y = data$Global_active_power, col = 2)

dev.copy(png, file = "plot2.png")
dev.off()
