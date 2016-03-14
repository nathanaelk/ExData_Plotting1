# Use a helper function to initialize the data set (download + load in memory) only if it has not been initialized
source('init_household_and_powerconsumption.R')

# Initialize the data set
household_power_consumption <- initializedataSet()
all_dateTime <- strptime(paste0(household_power_consumption$Date, ' ', 
                                household_power_consumption$Time), format='%Y-%m-%d %H:%M:%S')

#Open PNG file graphics device, resolution = 480x480
png(file='plot2.png', width=480, height = 480, units = 'px')

# Plot 2
# Plot the global active power against the date time and set the Y label
plot(all_dateTime, household_power_consumption$Global_active_power, 
     type = 'l', xlab=' ', ylab = 'Global Active Power (kilowatts)')

# Close png file
dev.off()