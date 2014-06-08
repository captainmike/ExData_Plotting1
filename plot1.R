# The function assumes data had been downloaded from:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and unzipped to 'data' folder in the working directory.
plot1 <- function() {
  csv <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")
  csv$DateTime <- strptime(paste(csv$Date, csv$Time), "%d/%m/%Y %H:%M:%S")
  s <- subset(csv, DateTime >= as.POSIXlt('2007-02-01') & DateTime < as.POSIXlt('2007-02-03'))
  
  png(filename='plot1.png')
  hist(s$Global_active_power, col='red', main='Global Active Power', xlab = 'Global Active Power (kilowatts)')
  dev.off()
}