library(dplyr)
library(lubridate)

rawData <- read.csv(file = "household_power_consumption.txt", sep = ";", na.strings = "?", as.is = c(1, 2))
data <- filter(rawData, grepl("^([1|2]/2/2007)", Date) & !is.na(Global_active_power))

png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power, 
     col = 2, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()
