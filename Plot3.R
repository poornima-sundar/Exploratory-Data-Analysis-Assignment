##Plot 3

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
with(dat, 
{
plot(dat$Sub_metering_1 ~ dat$DateTime, type = "l", ylab = "Energy Sub metering", xlab = "")
  lines(dat$Sub_metering_2 ~ dat$DateTime, col = 'Red')
  lines(dat$Sub_metering_3 ~ dat$DateTime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save the plot in png
dev.copy(png, filename="plot3.png")
dev.off()