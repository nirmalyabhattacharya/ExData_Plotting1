# Exploratory Data Analysis Project
# This is the R script for "plot1".
#___________________________________________________________________________________________

# Change the current working directory to the directory this script is  
thisdir<-getSrcDirectory(function(x) {x}) #Anonymous function to get the source directory. The anonymous function is dummy.

setwd(file.path(thisdir))

power_consumption<-read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")

#Read the column headers from the data file and assign appropriate names to the power_consumption data frame

column_headers <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
names(power_consumption)<-column_headers

# Add another column at the end to combine the date and time fields
power_consumption$date_time<-strptime(paste(power_consumption$Date, power_consumption$Time), format="%d/%m/%Y %H:%M:%S")


png(file = "plot1.png",width = 480, height = 480, units = "px",bg = "white")
    
hist(power_consumption$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab="Frequency",main = "Global Active Power", col = "red", ylim = c(0, 1200))

dev.off()

