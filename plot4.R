# Exploratory Data Analysis Project
# This is the R script for "plot4".
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


png(file = "plot4.png",width = 480, height = 480, units = "px",bg = "white")

par(mfcol = c(2,2))

with(power_consumption, {plot(date_time, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
    axis(1, at=c(as.numeric(min(power_consumption$date_time)), as.numeric(min(power_consumption$date_time))+86400, as.numeric(min(power_consumption$date_time))+2*86400), labels=c("Thu", "Fri", "Sat"))
    axis(2, yaxs = "r")
    with(power_consumption, points(date_time, Global_active_power, type = "l"))
    plot(date_time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    axis(1, at=c(as.numeric(min(power_consumption$date_time)), as.numeric(min(power_consumption$date_time))+86400, as.numeric(min(power_consumption$date_time))+2*86400), labels=c("Thu", "Fri", "Sat"))

    with(power_consumption, points(date_time, Sub_metering_1, type = "l"))
    with(power_consumption, points(date_time, Sub_metering_2, type = "l", col = "red"))
    with(power_consumption, points(date_time, Sub_metering_3, type = "l", col = "blue"))
    legend("topright", pch = "\u2014", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))          
    plot(date_time, Voltage, type = "n", xlab = "datetime")
    axis(1, at=c(as.numeric(min(power_consumption$date_time)), as.numeric(min(power_consumption$date_time))+86400
        , as.numeric(min(power_consumption$date_time))+2*86400), labels=c("Thu", "Fri", "Sat"))

    with(power_consumption, points(date_time, Voltage, type = "l"))
    plot(date_time, Global_reactive_power, type = "n", xlab = "datetime")
    axis(1, at=c(as.numeric(min(power_consumption$date_time)), as.numeric(min(power_consumption$date_time))+86400, as.numeric(min(power_consumption$date_time))+2*86400), labels=c("Thu", "Fri", "Sat"))

    with(power_consumption, points(date_time, Global_reactive_power, type = "l"))
})



dev.off()




