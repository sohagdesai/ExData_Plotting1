library(graphics)
plot4 <- function() {
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
        png(filename = "plot4.png")
        
        # Set up the array of plots: 2 x 2
        par(mfrow = c(2,2))
        
        # First plot in top left: Global Active Power  
        plot(strptime(hpcdata1$Date_and_Time, "%Y-%m-%d %H:%M:%S"),
             as.numeric(as.character(hpcdata1$Global_active_power)),
             xlab = "", 
             ylab = "Global Active Power", 
             type = "l")         
        
        # Second plot in top left: Voltage          
        plot(strptime(hpcdata1$Date_and_Time, "%Y-%m-%d %H:%M:%S"),
             as.numeric(as.character(hpcdata1$Voltage)),
             xlab = "", 
             ylab = "Voltage",
             sub  = "datetime",
             type = "l") 
        
        # Third plot in bottom left: Energy sub metering
        plot(strptime(hpcdata1$Date_and_Time, "%Y-%m-%d %H:%M:%S"),
             as.numeric(as.character(hpcdata1$Sub_metering_1)),
             xlab = "", 
             ylab = "Energy sub metering", 
             type = "l",
             col  = "black",
             ylim = c(0,38)) 
        
        # Set new to TRUE to make the next plot NOT clean the frame (as if it
        # were a new device)
        par(new = TRUE)

        # Plot the submetering 2 data in red; set Y axis limit to max
        # value across submetering 1, 2 and 3 (found by using summary command)        
        plot(strptime(hpcdata1$Date_and_Time, "%Y-%m-%d %H:%M:%S"),
             as.numeric(as.character(hpcdata1$Sub_metering_2)),
             xlab = "", 
             ylab = "", 
             type = "l",
             col  = "red",
             ylim = c(0,38)) 
        
        # Set new to TRUE to make the next plot NOT clean the frame (as if it
        # were a new device)        
        par(new = TRUE)
        
        # Plot the submetering 3 data in blue; set Y axis limit to max
        # value across submetering 1, 2 and 3 (found by using summary command)        
        plot(strptime(hpcdata1$Date_and_Time, "%Y-%m-%d %H:%M:%S"),
             as.numeric(as.character(hpcdata1$Sub_metering_3)),
             xlab = "", 
             ylab = "", 
             type = "l",
             col  = "blue",
             ylim = c(0,38)) 
        
        # Set the legend; note: no box around legend (bty = "n")
        legend('topright', 
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black","red","blue"),
               bty = "n",
               lty = 1)
        
        # Fourth plot in bottom right: Global Reactive Power       
        plot(strptime(hpcdata1$Date_and_Time, "%Y-%m-%d %H:%M:%S"),
             as.numeric(as.character(hpcdata1$Global_reactive_power)),
             xlab = "", 
             ylab = "Global_reactive_power", 
             sub  = "datetime", 
             type = "l")                
 
        # Turn off the device
        dev.off()
}