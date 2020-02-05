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

# Create plot2
with(epc, plot(DateTime,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

# Export to PNG
dev.copy(png, file = "plot2.png")
dev.off()