

fulldata=read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
mydata=fulldata[fulldata$Date=='1/2/2007'|fulldata$Date=='2/2/2007',]
hist(mydata$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
#png(filename='plot 1/plot1.png',width=480,height=480,units='px')
