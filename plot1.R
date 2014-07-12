## Exploratory Data Analysis
## Programming Assignment 1
## Plot 1

## Import dataset, format Date, and subset

data.all <- read.table(file="./household_power_consumption.txt", header=TRUE, sep=";",
                       na.strings="?", colClasses=c("character", "character", "numeric", 
                                                    "numeric", "numeric", "numeric", 
                                                    "numeric", "numeric", "numeric"))
data.all$Date <- as.Date(data.all$Date, format = "%d/%m/%Y")
data.subset <- subset(data.all, data.all$Date >= "2007-02-01" & data.all$Date <= "2007-02-02")

## Plot the Global Active power into a histogram and save as .png

hist(data.subset$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red", 
     cex.axis = 0.75, cex.lab = 0.75, cex.main = 0.75)
dev.copy(png, file = "./plot1.png")
dev.off()