get_clean_data <- function() {
  clean_data_filename = 'clean_data.Rdata'
  if (!file.exists(clean_data_filename)){
    # download data
    
    temp_file <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp_file, method="curl")
    dirty_data <- read.table(unz(temp_file, 'household_power_consumption.txt'), sep=';', header = TRUE, na.strings = "?",
                             colClasses = c("character","character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
    dirty_data$Date <- as.Date(dirty_data$Date, '%d/%m/%Y')
    
    # clean data for period 2007-02-01 - 2007-02-02
    clean_data <- subset(dirty_data, Date >= as.Date('2007-02-01', '%Y-%m-%d') & Date <= as.Date('2007-02-02', '%Y-%m-%d') )
    rm(dirty_data)
    unlink(temp_file)
    clean_data$Time <- strptime(paste(clean_data$Date, clean_data$Time), "%Y-%m-%d %H:%M:%S")
    # save for reuse
    save(clean_data, file = clean_data_filename)
  }
  load(clean_data_filename)
  return(clean_data)
}  
