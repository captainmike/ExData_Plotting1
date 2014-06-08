# The script assumes the data had been downloaded from:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and unzipped to 'data' folder in the working directory.

csv <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")
csv$DateTime <- strptime(paste(csv$Date, csv$Time), "%d/%m/%Y %H:%M:%S")
s <- subset(csv, DateTime >= as.POSIXlt('2007-02-01') & DateTime < as.POSIXlt('2007-02-03'))

png(filename='plot4.png')
par(mfcol=c(2,2))

# top left:
plot(s$DateTime, s$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')

# bottom left:
with(s, plot(DateTime, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'))
with(s, lines(DateTime, Sub_metering_2, col='red'))
with(s, lines(DateTime, Sub_metering_3, col='blue'))
legend("topright", lty=1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# top right:
with(s, plot(DateTime, Voltage, type='l', xlab='datetime'))

# bottom left:
with(s, plot(DateTime, Global_reactive_power, type='l', xlab='datetime'))

dev.off()