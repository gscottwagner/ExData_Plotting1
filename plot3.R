## Exploratory Data Analysis
## Programming Assignment 1
## Plot 3

## Import dataset, format Date, and subset

data.all <- read.table(file="./household_power_consumption.txt", header=TRUE, sep=";",
                       na.strings="?", colClasses=c("character", "character", "numeric", 
                                                    "numeric", "numeric", "numeric", 
                                                    "numeric", "numeric", "numeric"))
data.all$Date <- as.Date(data.all$Date, format = "%d/%m/%Y")
data.subset <- subset(data.all, data.all$Date >= "2007-02-01" & data.all$Date <= "2007-02-02")

## Combine the date and time columns and convert to date+time format

data.subset$Date <- as.character(data.subset$Date) 
data.subset$DateTime <- do.call(paste, c(data.subset[c("Date", "Time")], sep = " "))
data.subset$DateTime <- strptime(data.subset$DateTime, "%Y-%m-%d %H:%M:%S")

## Plot the data without points but add lines of several variables

plot(data.subset$DateTime, data.subset$Sub_metering_1, type = "n" , xlab = "",
     ylab = "Energy sub metering", cex.axis = 0.75, cex.lab = 0.75)
lines(data.subset$DateTime, data.subset$Sub_metering_1, type="l")
lines(data.subset$DateTime, data.subset$Sub_metering_2, type="l", col = "red")
lines(data.subset$DateTime, data.subset$Sub_metering_3, type="l", col = "blue")

## Add legend

legend("topright", pch = "-", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.7)

## Save as .png

dev.copy(png, file = "./plot3.png")
dev.off()
