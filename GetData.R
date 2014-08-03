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

#========================================================================================
# LOAD MAIN DATASET
#========================================================================================
mydata <- fread("C:/Users/Ben/STUDY/Exploratory.Data.Analysis/Assignment.01/household_power_consumption.txt",stringsAsFactors = FALSE,header = TRUE,sep=";")

#========================================================================================
# SUBSET DATA 
#========================================================================================
power.con <- subset(mydata,Date == "1/2/2007"|Date == "2/2/2007")


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

#----- CONVERT '?' TO NA -------#

# Global_active_power
if (length(which(power.con$Global_active_power == "?")) > 0) {
  power.con$Global_active_power <- replace(power.con$Global_active_power,which(power.con$Global_active_power == "?"), NA) 
}

# Global_reactive_power
if (length(which(power.con$Global_reactive_power == "?")) > 0) {
  power.con$Global_reactive_power <- replace(power.con$Global_reactive_power,which(power.con$Global_reactive_power == "?"), NA)
}

# Voltage
if (length(which(power.con$Voltage == "?")) > 0) {
  power.con$Voltage <- replace(power.con$Voltage,which(power.con$Voltage == "?"), NA)
}

# Global_intensity
if (length(which(power.con$Global_intensity == "?")) > 0) {
  power.con$Global_intensity <- replace(power.con$Global_intensity,which(power.con$Global_intensity == "?"), NA)
}

# Sub_metering_1
if (length(which(power.con$Sub_metering_1 == "?")) > 0) {
  power.con$Sub_metering_1 <- replace(power.con$Sub_metering_1,which(power.con$Sub_metering_1 == "?"), NA)
}

# Sub_metering_2
if (length(which(power.con$Sub_metering_2 == "?")) > 0) {
  power.con$Sub_metering_2 <- replace(power.con$Sub_metering_2,which(power.con$Sub_metering_2 == "?"), NA)
}

# Sub_metering_3
if (length(which(power.con$Sub_metering_3 == "?")) > 0) {
  power.con$Sub_metering_3 <- replace(power.con$Sub_metering_3,which(power.con$Sub_metering_3 == "?"), NA)
}

#----- CONVERT NUMERIC FIELDS -----#
power.con$Global_active_power <- as.numeric(power.con$Global_active_power)
power.con$Global_reactive_power <- as.numeric(power.con$Global_reactive_power)
power.con$Voltage <- as.numeric(power.con$Voltage)
power.con$Sub_metering_1 <- as.numeric(power.con$Sub_metering_1)
power.con$Sub_metering_2 <- as.numeric(power.con$Sub_metering_2)
power.con$Sub_metering_3 <- as.numeric(power.con$Sub_metering_3)
#========================================================================================
