
fulldata=read.table("../household_power_consumption.txt",header=T,sep=";",na.strings="?")
mydata=fulldata[fulldata$Date=='1/2/2007'|fulldata$Date=='2/2/2007',]
mydata=transform(mydata,Date=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S", tz="UTC"))
png(filename='plot3.png')
plot(mydata$Date, mydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(mydata$Date,mydata$Sub_metering_2,type="l",col="red")
lines(mydata$Date,mydata$Sub_metering_3,type="l",col="blue")
legend("topright", legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col = c("black","red","blue"),cex=0.75,lty="solid")
dev.off()