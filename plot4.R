# Use a helper function to initialize the data set (download + load in memory) only if it has not been initialized
source('init_household_and_powerconsumption.R')

# Initialize the data set
household_power_consumption <- initializedataSet()
all_dateTime <- strptime(paste0(household_power_consumption$Date, ' ',
                                household_power_consumption$Time), format='%Y-%m-%d %H:%M:%S')

#Open PNG file graphics device, resolution = 480x480
png(file='plot4.png', width=480, height = 480, units = 'px')

# Plot4
# Set the mrow parameter to have a matrix 2 by 2 of graphs
par(mfrow=c(2,2))

# Plot a line graph for the global active power and set the labels
plot(all_dateTime, household_power_consumption$Global_active_power, xlab = ' ', 
     ylab = 'Global Active Power', type='l')

# Plot a line graph for the voltage and set the labels
plot(all_dateTime, household_power_consumption$Voltage, xlab = 'datetime', 
     ylab = 'Voltage', type='l')

# Plot a line graph for the Sub_metering_1, set the labels, add the points for Sub_metering_2,
# Sub_metering_3, and set the legend
plot(all_dateTime, household_power_consumption$Sub_metering_1, type='l', xlab = ' ', 
     ylab='Energy sub metering')
points(all_dateTime, household_power_consumption$Sub_metering_2, col='red', type='l')
points(all_dateTime, household_power_consumption$Sub_metering_3, col='blue', type='l')

legend('topright', pch=c('-','-', '-'), lty=c(1,1,1), col=c('black', 'red', 'blue'), 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# Plot a line graph for the global reactive power and set the labels
plot(all_dateTime, household_power_consumption$Global_reactive_power, xlab = 'datetime', 
     ylab = 'Global_reactive_power', type='l')

# Close the graphics device
dev.off()