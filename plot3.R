# plot3.R 
#set working directory
#setwd("D:/projects/OnlineCourses/04 ExploratoryDataAnalysis/project1/ExData_Plotting1");

#copy household_power_consumption.txt to the working directory
#read file, convert datetime and subset data with two dates
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
              colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), 
              nrows=70000);
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
df <- subset(data, as.Date(DateTime) >= '2007-02-01' & as.Date(DateTime) <='2007-02-02')


#create plot and save as plot3.png
png(filename="plot3.png",width=480,height=480,units="px")
plot(df$DateTime,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(df$DateTime,df$Sub_metering_2,type="l",col="RED")
points(df$DateTime,df$Sub_metering_3,type="l",col="BLUE")
legend("topright", 
       col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1
       )
dev.off()
