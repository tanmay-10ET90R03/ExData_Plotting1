# Data Reading, naming and subsetting of power consumption

power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively

subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# implementing plot function, first creating the png file then plot creation

png(file="C:/Users/tanmay.bhowmik/Downloads/Online_Certificates/Exploratory Data Analysis Assignment/plot2.png", width=400, height=400)
plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

# annotating graph
title(main="Global Active Power Vs Time")
