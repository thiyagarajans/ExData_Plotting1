
# read using sqldf library, data for selected dates only
library(sqldf)
df <- read.csv.sql("data.txt", sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', sep = ";")
# opening device
png(filename = "plot1.png", width = 480, height = 480)
#Main Title (main), axes labels and colors are chosen appropriately 
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts", ylab = "Frequency", col = "red")
dev.off()  #closing the graphics
