#Data Reading, naming and subsetting of power consumption

power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


#implementing plot function, first creating the png file then creation of histogram

png(file="C:/Users/tanmay.bhowmik/Downloads/Online_Certificates/Exploratory Data Analysis Assignment/plot1.png", width=400, height=400)
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()

# annotating graph
title(main="Global Active Power")
