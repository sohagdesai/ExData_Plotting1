library(graphics)
plot3 <- function() {
        # Read in data
        hpcdata <- read.csv("household_power_consumption.txt",sep=";")
        
        # Subset the data to lie between the two days of interest
        hpcdata1 <- subset(hpcdata[as.Date(hpcdata$Date,format = "%d/%m/%Y") 
                                   >= as.Date("2007-02-01") & 
                                           as.Date(hpcdata$Date,format = "%d/%m/%Y") 
                                   <= as.Date("2007-02-02") ,])
        
        
        # Constuct a column with Data and Time columns merged together
        xdata <- paste(as.Date(hpcdata1$Date, format="%d/%m/%Y"),
                       hpcdata1$Time)
        
        # Insert this column into the data frame so that strptime()
        # can be used on this new column
        hpcdata1 <- cbind("Date_and_Time" = xdata, hpcdata1)
        
        # Set up the PNG file to write to
        png(filename = "plot3.png")
        
        # Plot the data as a line chart (type = "l")
        plot(strptime(hpcdata1$Date_and_Time, "%Y-%m-%d %H:%M:%S"),
             as.numeric(as.character(hpcdata1$Sub_metering_1)),
             xlab = "", 
             ylab = "Energy sub metering", 
             type = "l",
             col  = "black",
             ylim = c(0,38)) 
        
        par(new = TRUE)
        
        plot(strptime(hpcdata1$Date_and_Time, "%Y-%m-%d %H:%M:%S"),
             as.numeric(as.character(hpcdata1$Sub_metering_2)),
             xlab = "", 
             ylab = "", 
             type = "l",
             col  = "red",
             ylim = c(0,38)) 
        
        par(new = TRUE)
        
        plot(strptime(hpcdata1$Date_and_Time, "%Y-%m-%d %H:%M:%S"),
             as.numeric(as.character(hpcdata1$Sub_metering_3)),
             xlab = "", 
             ylab = "", 
             type = "l",
             col  = "blue",
             ylim = c(0,38)) 
        
        legend('topright', 
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black","red","blue"),
               lty = 1)
 
        # Turn off the device
        dev.off()
}