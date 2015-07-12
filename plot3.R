data <- read.table("C:/Users/jste644/Documents/R/Exploratory_data_analysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
dat <- subset(data,Date=="1/2/2007" | Date=="2/2/2007")

dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
library(lubridate)
dat$date_time <- paste(dat$Date,dat$Time,sep=" ")
dat$date_time <- ymd_hms(dat$date_time)
dat$day <- wday(dat$date_time, label = TRUE, abbr = FALSE)
xrange <- range(dat$date_time)
yrange <- range(dat$Sub_metering_1) 
days <- c("Thursday","Friday","Saturday")

png("C:/Users/jste644/Documents/R/Exploratory_data_analysis/plot3.png",width=480,height=480)
plot(dat$date_time, dat$Sub_metering_1,axes=T, ylim=yrange, typ='l', ann=T,ylab="Energy sub metering",xlab="")
lines(dat$date_time,dat$Sub_metering_2,lwd=1,type="l",col="red")
lines(dat$date_time,dat$Sub_metering_3,lwd=1,type="l",col="blue")

#axis(1,at=c("2007-02-01 00:00:00","2007-02-02 00:00:00","2007-02-02 23:59:00"),
#    labels=days, lwd=2, lwd.ticks=2)

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"),bty="n")
dev.off()