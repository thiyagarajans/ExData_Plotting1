
# read using sqldf library, data for selected dates only
library(sqldf)
df <- read.csv.sql("data.txt", sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', sep = ";")
png(filename = "plot1.png", width = 480, height = 480)
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts", ylab = "Frequency", col = "red")
dev.off()
