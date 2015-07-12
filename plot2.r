data <- read.table("C:/Users/jste644/Documents/R/Exploratory_data_analysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
dat <- subset(data,Date=="1/2/2007" | Date=="2/2/2007")

dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
library(lubridate)
dat$date_time <- paste(dat$Date,dat$Time,sep=" ")
dat$date_time <- ymd_hms(dat$date_time)
dat$day <- wday(dat$date_time, label = TRUE, abbr = FALSE)
xrange <- range(dat$day)
yrange <- range(dat$Global_active_power) 

png("C:/Users/jste644/Documents/R/Exploratory_data_analysis/plot2.png",width=480,height=480)
plot(dat$date_time,dat$Global_active_power, axes=T, ylim=yrange, typ='l', ann=T,ylab="Global Active Power (kilowatts)",xlab="")
axis(1,at=c("2007-02-01 00:00:00","2007-02-02 00:00:00","2007-02-02 23:59:00"),
labels=c("Thursday","Friday","Saturday"), lwd=2, lwd.ticks=2)
dev.off()