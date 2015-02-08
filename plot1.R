#Import Data
mytable <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
ftable <- mytable[grepl("^[12]/2/2007",mytable$Date),]

#Create Plot
png(filename="plot1.png")
hist(ftable$Global_active_power,main="Global Active Power", xlab="Global Active Power(kilowatts)",col="Red")
dev.off()
