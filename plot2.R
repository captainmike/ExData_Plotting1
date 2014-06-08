# The script assumes the data had been downloaded from:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and unzipped to 'data' folder in the working directory.

csv <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")
csv$DateTime <- strptime(paste(csv$Date, csv$Time), "%d/%m/%Y %H:%M:%S")
s <- subset(csv, DateTime >= as.POSIXlt('2007-02-01') & DateTime < as.POSIXlt('2007-02-03'))

png(filename='plot2.png')
plot(s$DateTime, s$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
dev.off()