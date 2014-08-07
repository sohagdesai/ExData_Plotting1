library(graphics)
plot1 <- function() {
    # Read in data
    hpcdata <- read.csv("household_power_consumption.txt",sep=";")

    # Subset the data to lie between the two days of interest
    hpcdata1 <- subset(hpcdata[as.Date(hpcdata$Date,format = "%d/%m/%Y") 
                >= as.Date("2007-02-01") & 
                as.Date(hpcdata$Date,format = "%d/%m/%Y") 
                <= as.Date("2007-02-02") ,])

    # Set up the PNG file to write to
    png(filename = "plot1.png")

    # Plot histogram
    hist(as.numeric(as.character(hpcdata1$Global_active_power)),
         xlab="Global Active Power (kilowatts)", 
         main = "Global Active Power",col="red")

    # Turn off the device
    dev.off()
}
