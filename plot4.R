# read using sqldf library, data for selected dates only
library(sqldf)
# Note: Original data file "household_power_consumption.txt" renamed to "data.txt" for convenience
df <- read.csv.sql("data.txt", sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', sep = ";")
png(filename = "plot4.png", width = 480, height = 480) #open graphics device
par(mfrow=c(2,2)) #Initialize 2 x 2 plots.
#plot 1 Same as plot 2.R
plot(df$Global_active_power, type="l", xlab = " ", ylab = "Global Active Power (kilowatts)", xaxt = "n", ylim = c(0,8), yaxt = "n")
axis(2, at = c(0, 2, 4, 6))
axis(1, at = c(0, 1400, 2880), labels = c("Thu", "Fri", "Sat"))
#plot 2  
plot(df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n", ylim = c(232,248), yaxt = "n")
axis(1, at = c(0, 1400, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at = c(234, 238, 242, 246))
#Y axis ticks did not create minor ticks. Adding them again with blank labels
axis(2, at = c(236, 240, 244), labels = c("", "", ""))
#plot 3 Same as plot3.R Additional flag 'cex' reduces font size of the legend.
plot(df$Sub_metering_1, type="l", xlab = " ", ylab = "Energy sub metering", xaxt = "n", ylim = c(0,40), yaxt = "n")
lines(df$Sub_metering_2, col = "red")
lines(df$Sub_metering_3, col = "blue")
axis(1, at = c(0, 1400, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at = c(0, 10, 20, 30))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1:1), col =c("black", "red", "blue"), cex = 0.6)
#plot 4 Default range of the plot was overridden with axis commands.
plot(df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n", ylim = c(0.0,0.5), yaxt="n")
axis(1, at = c(0, 1400, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5), labels = c("0.0", "0.1", "0.2", "0.3", "0.4", "0.5"))
dev.off()
