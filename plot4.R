After finished to download the dataset, it have been saved in a folder wich named R_data on the local disc C. 

#load the data into R from my computer (local disc C), named the data power_consumption.
power_consumption=read.table("C:/R_Data/Household_Consumption/household_power_consumption.txt",sep=";",header=TRUE)


#Quick check for view if all observations were successfully imported.
str(power_consumption)

#convert the Date with the "as.Date" function
power_consumption$Date=as.Date(power_consumption$Date,format="%d/%m/%Y")

#data corresponding to dates 2007-02-01 and 2007-02-02.
power_consumption_sub=subset(power_consumption, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#convert the time with the "strptime" function
dave=paste(as.character(power_consumption_sub$Date),as.character(power_consumption_sub$Time),sep=" ")
rod=strptime(dave,format="%Y-%m-%d %H:%M")
power_consumption_sub$Time=rod

#convert rest of variables from factor to numeric
for (i in 3:9)
{
power_consumption_sub[,i]=as.numeric(as.character(power_consumption_sub[,i]))
 }
 data=power_consumption_sub
 
 #code for plot4
png("Plot4.png",bg="white")
par(mfrow=c(2,2))
plot(data$Time,data$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")
plot(data$Time,data$Voltage,ylab="Voltage",type="l",xlab="datetime")
plot(data$Time,data$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
plot.xy(xy.coords(data$Time,data$Sub_metering_2),type="l",col="red")
plot.xy(xy.coords(data$Time,data$Sub_metering_3),type="l",col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
plot(data$Time,data$Global_reactive_power,ylab="Global_reactive_power",type="l",xlab="datetime")
dev.off()
