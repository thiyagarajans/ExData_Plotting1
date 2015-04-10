# read using sqldf library, data for selected dates only
library(sqldf)
library(lubridate)
df <- read.csv.sql("data.txt", sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', sep = ";")
png(filename = "plot2.png", width = 480, height = 480)
plot(df$Global_active_power, type="l", xlab = " ", ylab = "Global Active Power (kilowatts)", xaxt = "n", ylim = c(0,8), yaxt = "n")
axis(2, at = c(0, 2, 4, 6))
axis(1, at = c(0, 1400, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()