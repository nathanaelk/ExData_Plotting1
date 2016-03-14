# Use a helper function to initialize the data set (download + load in memory) only if it has not been initialized
source('init_household_and_powerconsumption.R')

# Initialize the data set
household_power_consumption <- initializedataSet()
all_dateTime <- strptime(paste0(household_power_consumption$Date, ' ' 
                                ,household_power_consumption$Time), format='%Y-%m-%d %H:%M:%S')

#Open PNG file graphics device, resolution = 480x480
png(file='plot3.png', width=480, height = 480, units = 'px')

# Plot 3
# Plot the Sub_metering_1 with type 'l' for lines and set the Y label. The default color (black) is used
plot(all_dateTime, household_power_consumption$Sub_metering_1, type='l',
     xlab = ' ', ylab='Energy sub metering')

# Add to the existing plots the points for Sub_metering_2 and set the color red
points(all_dateTime, household_power_consumption$Sub_metering_2, col='red', type='l')

# Add to the existing plots the points for Sub_metering_3 and set the color blue
points(all_dateTime, household_power_consumption$Sub_metering_3, col='blue', type='l')

# Set the legend in the top right corner
legend('topright', pch=c('-','-', '-'), lty=c(1,1,1), col=c('black', 'red', 'blue'), 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# Close the PNG file graphics device
dev.off()