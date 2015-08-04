#Exploratory Data Analysis Course Project 1
#Plot 3

data <- read.table("C:/Users/jste644/Documents/R/Exploratory_data_analysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
dat <- subset(data,Date=="1/2/2007" | Date=="2/2/2007")

attach(dat)
Date <- as.Date(Date,"%d/%m/%Y")

library(lubridate)
date_time <- paste(Date,Time,sep=" ")
date_time <- ymd_hms(date_time)
xrange <- range(date_time)
yrange <- range(Sub_metering_1) 

png("C:/Users/jste644/Documents/R/Exploratory_data_analysis/plot3.png",width=480,height=480)

plot(date_time, Sub_metering_1,axes=T, ylim=yrange, typ='l', ann=T,ylab="Energy sub metering",xlab="")
  lines(date_time,Sub_metering_2,lwd=1,type="l",col="red")
  lines(date_time,Sub_metering_3,lwd=1,type="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"),bty="n")

dev.off()