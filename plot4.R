## Exploratory Data Analysis
## Programming Assignment 1
## Plot 4

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

## Plot four graphs on a page and adjust margins
## Graphs are plotted without points and added lines

par(cex.axis = 0.75, cex.lab = 0.75, mfrow = c(2,2), mar = (c(4.2, 4.2, 1.5, 1.5)))

  ## Plot 1
plot(data.subset$DateTime, data.subset$Global_active_power, type = "n" , xlab = "",
     ylab = "Global Active Power")
lines(data.subset$DateTime, data.subset$Global_active_power, type="l")
  
  ## Plot 2
plot(data.subset$DateTime, data.subset$Voltage, type = "n" , xlab = "datetime",
     ylab = "Voltage")
lines(data.subset$DateTime, data.subset$Voltage, type="l")

  ## Plot 3
plot(data.subset$DateTime, data.subset$Sub_metering_1, type = "n" , xlab = "",
     ylab = "Energy sub metering")
lines(data.subset$DateTime, data.subset$Sub_metering_1, type="l")
lines(data.subset$DateTime, data.subset$Sub_metering_2, type="l", col = "red")
lines(data.subset$DateTime, data.subset$Sub_metering_3, type="l", col = "blue")
legend("topright", pch = "-", cex=0.6, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  ## Plot 4
plot(data.subset$DateTime, data.subset$Global_reactive_power, type = "n" , xlab = "datetime",
        ylab = "Global_reactive_power")
lines(data.subset$DateTime, data.subset$Global_reactive_power, type="l")

## Save as .png

dev.copy(png, file = "./plot4.png")
dev.off()


