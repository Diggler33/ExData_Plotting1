#=========================================================================================
# Script written by Ben Palmer - 03 Aug 2014
# This code performs the following tasks
#   1. Call GetData.R script if the source data set does not exist (power.con)
#   2. Generate a line graph displaying Energy Sub Metering over two days 
#       (Sub Metering 1,2 & 3)
#=========================================================================================

#========================================================================================
#-- SET MY WORKING DIRECTORY
#========================================================================================
setwd("C:/Users/Ben/STUDY/Exploratory.Data.Analysis/Assignment.01/ExData_Plotting1")
#========================================================================================

#=========================================================================================
# Invoke Source data script if required
#=========================================================================================
if(!exists("power.con")) source("GetData.R")
#=========================================================================================

#=========================================================================================
# Generate graph and output to plot3.png
#=========================================================================================
plot.new()
png(filename = "plot3.png", height = 480, width = 480)
plot(power.con$Date,power.con$Sub_metering_1,type = "l",ylab = "Energy sub metering", main = "", xlab = "")
lines(power.con$Date,power.con$Sub_metering_2,type = "l",col="red")
lines(power.con$Date,power.con$Sub_metering_3,type = "l",col="blue")
legend("topright",lty= c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  col=c("black","red","blue"),cex=.8)
dev.off()
#=========================================================================================

