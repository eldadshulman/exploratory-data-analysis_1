electric <- read.table("D:/cursera/exploratory_data_analysis/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

electric$Date <- strptime(electric$Date, "%d/%m/%Y")

electric$Date <- as.Date(electric$Date)



electric$Time <- strptime(electric$Time, "%H:%M:%S")


electric2 <- subset(electric, (electric$Date == "2007-02-01 IST" )|( electric$Date == "2007-02-02 IST"))


electric2$Time <- gsub("2017-12-17 ",replacement = "", x= electric2$Time)

electric2$datetime <- as.POSIXct(electric2$datetime)





with(electric2, plot(datetime, Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)"))

with(electric2, lines(datetime, Global_active_power))
