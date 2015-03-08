
# Reading the data from the file at root directory
fulldata=read.table("../household_power_consumption.txt",header=T,sep=";",na.strings="?")
# Subsetting the 2 days of observations
mydata=fulldata[fulldata$Date=='1/2/2007'|fulldata$Date=='2/2/2007',]
# Merging date and time column in a new column of the dataset
mydata=transform(mydata,Datetime=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S", tz="UTC"))
# Creating the PNG file
png(filename='plot2.png')
# Creating the diagram
plot(mydata$Datetime, mydata$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')
# Closing the output device
dev.off()
