
# Reading the data from the file at root directory
fulldata=read.table("../household_power_consumption.txt",header=T,sep=";",na.strings="?")
# Subsetting the 2 days of observations
mydata=fulldata[fulldata$Date=='1/2/2007'|fulldata$Date=='2/2/2007',]
# Creating the PNG file
png(filename='plot1.png')
# Creating the diagram
hist(mydata$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
# Closing the output device
dev.off()