#=========================================================================================
# Script written by Ben Palmer - 03 Aug 2014
# This code performs the following tasks
#   1. Call GetData.R script if the source data set does not exist (power.con)
#   2. Generate a Historgram displaying Global Active Power by Frequency
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
# Generate Histogram and output to plot1.png
#=========================================================================================
plot.new()
png(filename = "plot1.png", height = 480, width = 480)
hist(power.con$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (Kilowatts)",col="red" )
dev.off()
#=========================================================================================

