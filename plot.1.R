library("lubridate")
#unzip and read in data
unzip("exdata_data_household_power_consumption.zip")
powerdata_all <- read.table("household_power_consumption.txt",skip = 1,sep = ";",col.names = c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global-intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3'))
subset_powerdata <- subset(powerdata_all, Date %in% c("1/2/2007","2/2/2007"))
#change Date class
subset_powerdata$Date <- as.Date(subset_powerdata$Date,format="%d/%m/%Y")
#change Time class
subset_powerdata$Time <- strptime(subset_powerdata$Time, format ="%H:%M:%S")


#save plot as a png file
png(file="plot1.png",width = 480, height = 480)
#plot data
hist(as.numeric(as.character(subset_powerdata$Global_active_power)),main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col = "Red")
dev.off()

