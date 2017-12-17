electric <- read.table("D:/cursera/exploratory_data_analysis/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

electric$Date <- strptime(electric$Date, "%d/%m/%Y")

electric$Date <- as.Date(electric$Date)

electric$Time <- strptime(electric$Time, "%H:%M:%S")


electric2 <- subset(electric, (electric$Date == "2007-02-01 IST" )|( electric$Date == "2007-02-02"))

png("D:/cursera/exploratory_data_analysis/Plot1.png", width = 480, height = 480)

hist(electric2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()