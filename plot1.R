    library(dplyr)
    library(lubridate)
    
    rawData <- read.csv(file = "household_power_consumption.txt", sep = ";", na.strings = "?", as.is = c(1, 2))
    data <- filter(rawData, grepl("^([1|2]/2/2007)", Date) & !is.na(Global_active_power))
    hist(data$Global_active_power, 
         col = 3, 
         main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)")
    dev.copy(png, file = "plot1.png")
    dev.off()
