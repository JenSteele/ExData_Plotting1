data <- read.table("C:/Users/jste644/Documents/R/Exploratory_data_analysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
dat <- subset(data,Date=="1/2/2007" | Date=="2/2/2007")

dat$Date <- as.Date(dat$Date,"%d/%m/%Y")

library(lubridate)
dat$date_time <- paste(dat$Date,dat$Time,sep=" ")
dat$date_time <- ymd_hms(dat$date_time)

png("C:/Users/jste644/Documents/R/Exploratory_data_analysis/plot4.png",width=480,height=480)
attach(dat)
par(mfrow=c(2,2))

plot(date_time,Global_active_power, axes=T, ylim=range(Global_active_power), typ='l', ann=T,ylab="Global Active Power (kilowatts)",xlab="")

plot(date_time,Voltage, axes=T, ylim=range(Voltage), typ='l', ann=T,ylab="Voltage",xlab="datetime")

plot(date_time, Sub_metering_1,axes=T, ylim=range(Sub_metering_1), typ='l', ann=T,ylab="Energy sub metering",xlab="")
  lines(date_time,Sub_metering_2,lwd=1,type="l",col="red")
  lines(date_time,Sub_metering_3,lwd=1,type="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"),bty="n")

plot(date_time,Global_reactive_power, axes=T, ylim=range(Global_reactive_power), typ='l', ann=T,ylab="Global_reactive_power",xlab="datetime")

dev.off()

