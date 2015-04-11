# read using sqldf library, data for selected dates only
library(sqldf)
df <- read.csv.sql("data.txt", sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', sep = ";")
png(filename = "plot3.png", width = 480, height = 480)  #open graphics device
#plotting without axis labels or ticks. Specifying the Y-range manually. Only Sub_metering_1 data are plotted.
plot(df$Sub_metering_1, type="l", xlab = " ", ylab = "Energy sub metering", xaxt = "n", ylim = c(0,40), yaxt = "n")
lines(df$Sub_metering_2, col = "red") #Sub_metering_2 data are plotted in red
lines(df$Sub_metering_3, col = "blue") #Sub_metering_3 data are plotted in blue
axis(1, at = c(0, 1400, 2880), labels = c("Thu", "Fri", "Sat")) #X-axis labels and ticks
axis(2, at = c(0, 10, 20, 30)) # Y-axis labels and ticks
#Legends are added separately, lty includes line type '1' before legends, col is to match what is used before.
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1:1), col =c("black", "red", "blue"))
dev.off()