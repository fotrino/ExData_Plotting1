setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

# Read the table
epc <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE,na.strings='?',
                colClasses = c('myDate','character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')
)

# Select the desired dates
epc <-subset(epc, Date == "2007-02-01" | Date == "2007-02-02")

# Create plot1
hist(epc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")