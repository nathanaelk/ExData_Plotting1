initializedataSet <- function() {
  if (exists('nate_project1_exploratory_data_analysis') == FALSE)
  {
    if (length(which(dir() == 'household_power_consumption.txt')) == 0)
    {
      download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip')
      unzip('household_power_consumption.zip')
    }
    
    household_power_consumption <- read.delim('household_power_consumption.txt', sep = ';', na.strings = '?')
    
    library(dplyr)
    
    household_power_consumption <- mutate(household_power_consumption, Date = as.Date(Date, format='%d/%m/%Y'))
    
    minDate <- as.Date('2007-02-01')
    maxDate <- as.Date('2007-02-02') 
    
    household_power_consumption <- filter(household_power_consumption, Date >= minDate & Date <= maxDate)
    
    
    nate_project1_exploratory_data_analysis <- TRUE
    
    return(household_power_consumption)
  }  
}