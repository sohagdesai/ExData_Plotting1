library(graphics)
plot2 <- function() {
        hpcplotdata <- read.csv("household_power_consumption_subset.txt",sep=";")
        png(filename = "plot2.png")
        plot(hpcplotdata$Time,hpcplotdata$Global_active_power,ylab="Global Active Power (kilowatts)",xaxt="n")
        v1 <- c(1,1440,2880)
        v2 <- c("Thu","Fri","Sat")
        axis(side = 1, at = v1, labels = v2)
        dev.off()
}