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
 
 #code for plot1
 png("Plot1.png",bg="white")
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
