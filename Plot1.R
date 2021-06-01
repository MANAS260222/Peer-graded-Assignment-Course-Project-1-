#Reading, naming and subsetting power consumption data
activepower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(activepower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subactivepower <- subset(activepower,activepower$Date=="1/2/2007" | activepower$Date =="2/2/2007")

#calling the basic plot function
hist(as.numeric(as.character(subactivepower$Global_active_power)),col="blue",main="Global Active Power Data",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power Data")
















