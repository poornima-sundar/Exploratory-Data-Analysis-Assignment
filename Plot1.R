##Plot 1

## Reading teh Data 
f_name <- file("household_power_consumption.txt")

library("data.table")
dat <- read.table(f_name, header = TRUE, sep = ";", na.strings = "?")
str(dat)

#Subsetting the data
dat <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]

#Plotting an histogam for Global_Active_Power
hist(dat$Global_active_power,col ="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")

#Save the plot in png
dev.copy(png, filename="plot1.png")
dev.off()