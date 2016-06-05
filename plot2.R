# Exploratory Data Analysis Project
# This is the R script for "plot2".
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


png(file = "plot2.png",width = 480, height = 480, units = "px",bg = "white")
    

with(power_consumption, plot(date_time, Global_active_power, type = "n", xlab = "daytime", ylab = "Global Active Power (kilowatts)" ))
axis(1, at=c(as.numeric(min(power_consumption$date_time)), as.numeric(min(power_consumption$date_time))+86400, as.numeric(min(power_consumption$date_time))+2*86400), labels=c("Thu", "Fri", "Sat"))
axis(2, yaxs = "r")
with(power_consumption, points(date_time, Global_active_power, type = "l"))


dev.off()



