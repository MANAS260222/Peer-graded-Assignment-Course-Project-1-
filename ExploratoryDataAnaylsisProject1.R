#Reading, naming and subsetting power consumption data
activepower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(activepower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subactivepower <- subset(activepower,activepower$Date=="1/2/2007" | activepower$Date =="2/2/2007")

#calling the basic plot function
hist(as.numeric(as.character(subactivepower$Global_active_power)),col="blue",main="Global Active Power Data",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power Data")



#Number 2

activepower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(activepower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subactivepower <- subset(activepower,activepower$Date=="1/2/2007" | activepower$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subactivepower$Date <- as.Date(subactivepower$Date, format="%d/%m/%Y")
subactivepower$Time <- strptime(subactivepower$Time, format="%H:%M:%S")
subactivepower[1:1440,"Time"] <- format(subactivepower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subactivepower[1441:2880,"Time"] <- format(subactivepower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot function
plot(subactivepower$Time,as.numeric(as.character(subactivepower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Data Vs The progrssion of Time")


#Number 3
activepower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(activepower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subactivepower <- subset(activepower,activepower$Date=="1/2/2007" | activepower$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subactivepower$Date <- as.Date(subactivepower$Date, format="%d/%m/%Y")
subactivepower$Time <- strptime(subactvepower$Time, format="%H:%M:%S")
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

#3


power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot functions
plot(subpower$Time,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")



#4

# Reading, naming and subsetting power consumption data
subactivepower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(activepower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subactivepower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subactivepower$Date <- as.Date(subactivepower$Date, format="%d/%m/%Y")
subactivepower$Time <- strptime(subactivepower$Time, format="%H:%M:%S")
subactivepower[1:1440,"Time"] <- format(subactivepower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subactivepower[1441:2880,"Time"] <- format(subactivepower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# initiating a composite plot with many graphs
par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(subactivepower,{
  plot(subactivepower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subactivepower$Time,as.numeric(as.character(subpower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subactivepower$Time,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subactivepower,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subactivepower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subactivepower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subactivepower$Time,as.numeric(as.character(subactivepower$Global_reactive_activepower)),type="l",xlab="datetime",ylab="Global_reactive_power")
})


























