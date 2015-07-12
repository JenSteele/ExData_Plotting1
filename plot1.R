data <- read.table("C:/Users/jste644/Documents/R/Exploratory_data_analysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
dat <- subset(data,Date=="1/2/2007" | Date=="2/2/2007")
Global <- dat$Global_active_power
png("C:/Users/jste644/Documents/R/Exploratory_data_analysis/plot1.png",width=480,height=480)
hist(Global,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()