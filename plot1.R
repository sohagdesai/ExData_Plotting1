library(graphics)
plot1 <- function() {
    hpcplotdata <- read.csv("household_power_consumption_subset.txt",sep=";")
    png(filename = "plot1.png")
    hist(hpcplotdata$Global_active_power,xlab="Global Active Power (kilowatts)", main = "Global Active Power",col="red")
    dev.off()
}