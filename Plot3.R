electric <- read.table("D:/cursera/exploratory_data_analysis/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

electric$Date <- strptime(electric$Date, "%d/%m/%Y")

electric$Date <- as.Date(electric$Date)



electric$Time <- strptime(electric$Time, "%H:%M:%S")


electric2 <- subset(electric, (electric$Date == "2007-02-01 IST" )|( electric$Date == "2007-02-02 IST"))


electric2$Time <- gsub("2017-12-17 ",replacement = "", x= electric2$Time)

electric2$datetime <- as.POSIXct(electric2$datetime)


png("D:/cursera/exploratory_data_analysis/Plot3.png", width = 480, height = 480)


with(electric2, plot(datetime, Sub_metering_1, type = "n", ylab = "Global Active Power (kilowatts)", xlab = ""))

with(electric2,lines(datetime, Sub_metering_1))
with(electric2,lines(datetime, Sub_metering_2, col = "red")) 
with(electric2,lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lwd =1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()