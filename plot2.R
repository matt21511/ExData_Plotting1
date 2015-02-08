#Import Data

mytable <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
ftable <- mytable[grepl("^[12]/2/2007",mytable$Date),]

#Create plot

png(filename="plot2.png")
ftable$FullTime <- paste(ftable$Date,ftable$Time)
ftable$FullTime <- as.POSIXlt(ftable$FullTime,format="%d/%m/%Y %H:%M:%S")
plot(ftable$FullTime,ftable$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()
