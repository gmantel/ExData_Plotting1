# Reading the data from the file at root directory
fulldata=read.table("../household_power_consumption.txt",header=T,sep=";",na.strings="?")
# Subsetting the 2 days of observations
mydata=fulldata[fulldata$Date=='1/2/2007'|fulldata$Date=='2/2/2007',]
# Merging date and time column in a new column of the dataset
mydata=transform(mydata,Datetime=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S", tz="UTC"))
# Creating the PNG file
png('plot4.png')
# Defining the plot canvas
par(mfcol = c(2,2))

# Adding the 1st plot
plot(mydata$Datetime,mydata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")

# Adding the second plot with Sub_metering_1 data
plot(mydata$Datetime, mydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
# Adding a 2nd line to the plot with Sub_metering_2 data
lines(mydata$Datetime,mydata$Sub_metering_2,type="l",col="red")
# Adding a 3rd line to the plot with Sub_metering_3 data
lines(mydata$Datetime,mydata$Sub_metering_3,type="l",col="blue")
# Adding the legend
legend("topright", legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black","red","blue"),cex=0.75,lty="solid")

# Adding the third plot
plot(mydata$Datetime,mydata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Adding the fourth plot
plot(mydata$Datetime,mydata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Closing the output device
dev.off()