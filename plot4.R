setwd("C:/Users/dell/Desktop/Coursera-R/Assignments/Exploratory_Data_Analysis/Assignment-1")
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip", exdir = "power_data")
#list.files("./power_data")
setwd("./power_data")
data1<-read.table("household_power_consumption.txt",header = TRUE,sep=";")
#str(data1)
#head(data1,4)
small_data<-data1[as.character(data1$Date) %in% c("1/2/2007","2/2/2007"),] 
#head(small_data,4)
#str(small_data)


# Concatante Date and Time variables
small_data$dateTime = paste(small_data$Date, small_data$Time)
#head(small_data$dateTime)


# Convert to Date/Time class
small_data$dateTime <- strptime(small_data$dateTime, "%d/%m/%Y %H:%M:%S")
attach(small_data)

png("plot4.png",width=480,height = 480,units="px")


#plot the graph
par(mfrow=c(2,2))

plot(dateTime,as.numeric(as.character(Global_active_power)),ylab="Global Active Power",xlab="",type="l")

plot(dateTime,as.numeric(as.character(Voltage)),ylab="Voltage",xlab="datetime",type="l")

plot(dateTime,as.numeric(as.character(Sub_metering_1)),ylab="Energy sub metering",xlab="",type="l")
lines(dateTime,as.numeric(as.character(Sub_metering_2)),col="red")
lines(dateTime, as.numeric(as.character(Sub_metering_3)), col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

plot(dateTime,as.numeric(as.character(Global_reactive_power)),ylab="Global_reactive_power",xlab="datetime",type="l")

dev.off()


