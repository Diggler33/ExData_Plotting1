#=========================================================================================
# Script written by Ben Palmer - 03 Aug 2014
# This code performs the following tasks
#   1. Call GetData.R script if the source data set does not exist (power.con)
#   2. Generate a four grapg matrix by Frequency over two days
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
# Generate graph and output to plot4.png
#=========================================================================================
plot.new()
png(filename = "plot4.png", height = 480, width = 480)
par(mfrow = c(2,2),ps=12,mai = c(.9,.9,.3,.3))
plot(power.con$Date,power.con$Global_active_power,type = "l",ylab = "Global Active Power ", main = "", xlab = "",cex=.4)
plot(power.con$Date,power.con$Voltage,type = "l",ylab = "Voltage", main = "", xlab = "datetime")
plot(power.con$Date,power.con$Sub_metering_1,type = "l",ylab = "Energy sub metering", main = "", xlab = "")
lines(power.con$Date,power.con$Sub_metering_2,type = "l",col="red")
lines(power.con$Date,power.con$Sub_metering_3,type = "l",col="blue")
legend("topright",lty= c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  col=c("black","red","blue"),cex=.8,bty="n")
plot(power.con$Date,power.con$Global_reactive_power,type = "l",ylab = "Global_reactive_power ", main = "", xlab = "datetime")
dev.off()
#=========================================================================================

