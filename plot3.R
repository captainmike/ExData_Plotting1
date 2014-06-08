# The script assumes the data had been downloaded from:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and unzipped to 'data' folder in the working directory.

csv <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")
csv$DateTime <- strptime(paste(csv$Date, csv$Time), "%d/%m/%Y %H:%M:%S")
s <- subset(csv, DateTime >= as.POSIXlt('2007-02-01') & DateTime < as.POSIXlt('2007-02-03'))

png(filename='plot3.png')
with(s, plot(DateTime, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'))
with(s, lines(DateTime, Sub_metering_2, col='red'))
with(s, lines(DateTime, Sub_metering_3, col='blue'))
legend("topright", lty=1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()