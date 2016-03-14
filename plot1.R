# Use a helper function to initialize the data set (download + load in memory) only if it has not been initialized
source('init_household_and_powerconsumption.R')

# Initialize the data set
household_power_consumption <- initializedataSet()

#Open PNG file graphics device
png(file='plot1.png', width=480, height = 480, units = 'px')

#Plot1
# Plot the histogram for Global_active_power and set the axis label and title
hist(household_power_consumption$Global_active_power, col = 'red', 
     xlab = 'Global Active Power (killowatts)', main='Global Active Power')

#Close PNG file graphics device
dev.off()
