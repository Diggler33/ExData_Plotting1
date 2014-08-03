#=========================================================================================
# Script written by Ben Palmer - 03 Aug 2014
# This code performs the following tasks
#   1. Call GetData.R script if the source data set does not exist (power.con)
#   2. Generate a line graph displaying Global Active Power by Frequency over two days
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
# Generate Histogram and output to plot2.png
#=========================================================================================
plot.new()
png(filename = "plot2.png", height = 480, width = 480)
plot(power.con$Date,power.con$Global_active_power,type = "l",ylab = "Global Active Power (Kilowatts)", main = "", xlab = "")
dev.off()
#=========================================================================================

