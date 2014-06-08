csv <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")
csv$DateTime <- strptime(paste(csv$Date, csv$Time), "%d/%m/%Y %H:%M:%S")
s <- subset(csv, DateTime >= as.POSIXlt('2007-02-01') & DateTime < as.POSIXlt('2007-02-03'))