# plot1.R 
#set working directory
#setwd("D:/projects/OnlineCourses/04 ExploratoryDataAnalysis/project1/ExData_Plotting1");

#copy household_power_consumption.txt to the working directory
#read file, convert datetime and subset data with two dates
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
              colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), 
              nrows=70000);
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
df <- subset(data, as.Date(DateTime) >= '2007-02-01' & as.Date(DateTime) <='2007-02-02')

#create histogram and save to plot1.png
png(filename="plot1.png",width=480,height=480,units="px")
hist(df$Global_active_power, col="RED",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", 
     main="Global Active Power");
dev.off();

