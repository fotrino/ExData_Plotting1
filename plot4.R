setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

# Read the table
epc <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE,na.strings='?',
                colClasses = c('myDate','character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')
)

# Select the desired dates
epc <-subset(epc, Date == "2007-02-01" | Date == "2007-02-02")

# Create DateTime Column
epc$DateTime <- strptime(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow = c(2, 2))

# Create plot1
with(epc, plot(DateTime,Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

# Create plot2
with(epc, plot(DateTime,Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))

# Create plot3
with(epc, {
        plot(DateTime,Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(DateTime,Sub_metering_2, type = "l", col = "red")
        lines(DateTime,Sub_metering_3, type = "l", col = "blue")
        legend("topright", lwd = 1, bty = "n", col = c("black" ,"red", "blue"), legend = paste0("Sub_metering_", 1:3))
})

# Create plot4
with(epc, plot(DateTime,Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))

# Export to PNG
dev.copy(png, file = "plot4.png")
dev.off()