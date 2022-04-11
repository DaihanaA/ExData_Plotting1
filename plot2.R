#Reading the data
data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
summary(data)

#Subset the data from 2007
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Change the columns with numeric values
globalActivePower <- as.numeric(subsetdata$Global_active_power)

#convert day/time to POSIXct object
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plot2
png(filename="plot2.png", width=480, height = 480 )
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()