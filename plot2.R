## Exploratory Data Analysis
## Programming Assignment 1
## Plot 2

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

## Plot the data without points but add lines

plot(data.subset$DateTime, data.subset$Global_active_power, type = "n" , xlab = "",
     ylab = "Global Active Power (kilowatts)", cex.axis = 0.75, cex.lab = 0.75)
lines(data.subset$DateTime, data.subset$Global_active_power, type="l")

## Save as .png

dev.copy(png, file = "./plot2.png")
dev.off()

