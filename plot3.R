#Import Data

mytable <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
ftable <- mytable[grepl("^[12]/2/2007",mytable$Date),]

#Create plot

png(filename="plot3.png")
ftable$FullTime <- paste(ftable$Date,ftable$Time)
ftable$FullTime <- as.POSIXlt(ftable$FullTime,format="%d/%m/%Y $H:$M:$S")
plot(x=ftable$FullTime,y=ftable$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(ftable$FullTime,ftable$Sub_metering_2,col="Red")
lines(ftable$FullTime,ftable$Sub_metering_3,col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("Black","Red","Blue"))
dev.off()

