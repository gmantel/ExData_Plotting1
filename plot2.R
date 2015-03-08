
fulldata=read.table("../household_power_consumption.txt",header=T,sep=";",na.strings="?")
mydata=fulldata[fulldata$Date=='1/2/2007'|fulldata$Date=='2/2/2007',]
mydata=transform(mydata,Date=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S", tz="UTC"))
png(filename='plot2.png')
plot(mydata$Date, mydata$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')
dev.off()