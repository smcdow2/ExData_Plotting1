library("lubridate")
#unzip and read in data
unzip("exdata_data_household_power_consumption.zip")
powerdata_all <- read.table("household_power_consumption.txt",skip = 1,sep = ";",col.names = c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global-intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3'))
subset_powerdata <- subset(powerdata_all, Date %in% c("1/2/2007","2/2/2007"))
#change Date class
subset_powerdata$Date <- as.Date(subset_powerdata$Date,format="%d/%m/%Y")
#change Time class
subset_powerdata$Time <- strptime(subset_powerdata$Time, format ="%H:%M:%S")
subset_powerdata[1:1440,"Time"] <- format(subset_powerdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset_powerdata[1441:2880,"Time"] <- format(subset_powerdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#save plot as png file
png(file="plot3.png",width = 480, height = 480)

#plot data
plot(subset_powerdata$Time,as.numeric(as.character(subset_powerdata$Sub_metering_1)),type = "l",xlab = "", ylim = c(0,30),ylab = "Energy sub metering",main = "Energy mub metering")
lines(subset_powerdata$Time,as.numeric(as.character(subset_powerdata$Sub_metering_2)),col = "Red")
lines(subset_powerdata$Time,as.numeric(as.character(subset_powerdata$Sub_metering_3)),col = "Blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("Black","Red","Blue"),lty = 1)
dev.off()


