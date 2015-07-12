data <- read.table("C:/Users/jste644/Documents/R/Exploratory_data_analysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
dat <- subset(data,Date=="1/2/2007" | Date=="2/2/2007")

attach(dat)
Date <- as.Date(Date,"%d/%m/%Y")

library(lubridate)
date_time <- paste(Date,Time,sep=" ")
date_time <- ymd_hms(date_time)

yrange <- range(Global_active_power) 

png("C:/Users/jste644/Documents/R/Exploratory_data_analysis/plot2.png",width=480,height=480)

plot(date_time,Global_active_power, axes=T, ylim=yrange, typ='l', ann=T,ylab="Global Active Power (kilowatts)",xlab="")

dev.off()