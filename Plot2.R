##Plot 2

## Reading teh Data 
f_name <- file("household_power_consumption.txt")

library("data.table")
dat <- read.table(f_name, header = TRUE, sep = ";", na.strings = "?")
str(dat)

#Subsetting the data
dat <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]

#Adding the Column DateTime
DateTime <- strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
dat <- cbind(DateTime, dat)

#Generating the plot
plot(dat$DateTime, dat$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")

#Save the plot in png
dev.copy(png, filename="plot2.png")
dev.off()