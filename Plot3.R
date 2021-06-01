
activepower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(activepower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subactivepower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subactivepower$Date <- as.Date(subactivepower$Date, format="%d/%m/%Y")
subactivepower$Time <- strptime(subactivepower$Time, format="%H:%M:%S")
subactivepower[1:1440,"Time"] <- format(subactivepower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subactivepower[1441:2880,"Time"] <- format(subactivepower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot functions
plot(subactivepower$Time,subactivepower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subactivepower,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subactivepower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subactivepower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")
