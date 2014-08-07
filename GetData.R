#========================================================================================
# Assignment 1 - Exploratory Data Analysis (Load Data)
# Written by Ben Palmer 2 Aug 2014 
# This code performs the following tasks
#     1. Reads in data from household_power_consumption.txt
#     2. Subset Data to dates 01/02/2007 & 02/02/2007
#     3. Cleans dataset (Replace '?' with NA, Append Time stamp on to Date, 
#           Assign correct data types)
#========================================================================================

require(data.table) #-- Enable use of fread function

#,colClasses = c("character","character","character","character","character","character","character","character","character")

#========================================================================================
# LOAD MAIN DATASET
#========================================================================================
mydata <- fread("C:/Users/Ben/STUDY/Exploratory.Data.Analysis/Assignment.01/household_power_consumption.txt",colClasses = c("character","character","character","character","character","character","character","character","character") ,stringsAsFactors = FALSE,header = TRUE,sep=";",na.strings = c("?"))

#========================================================================================
# SUBSET DATA 
#========================================================================================
power.con <- subset(mydata,Date == "1/2/2007"|Date == "2/2/2007")
#summary(power.con)

#========================================================================================
# FREE MEMORY BY DROPPING MAIN DATASET
#========================================================================================
rm(mydata)

#========================================================================================
# CLEAN SUBSET DATA
#========================================================================================


#----- FORMAT DATES -------#

dFormat <- "%d/%m/%Y %H:%M:%S"
power.con$Date <-as.POSIXct(paste(power.con$Date,power.con$Time), format=dFormat)



#----- CONVERT NUMERIC FIELDS -----#
power.con$Global_active_power <- as.numeric(power.con$Global_active_power)
power.con$Global_reactive_power <- as.numeric(power.con$Global_reactive_power)
power.con$Voltage <- as.numeric(power.con$Voltage)
power.con$Sub_metering_1 <- as.numeric(power.con$Sub_metering_1)
power.con$Sub_metering_2 <- as.numeric(power.con$Sub_metering_2)
power.con$Sub_metering_3 <- as.numeric(power.con$Sub_metering_3)
#========================================================================================

