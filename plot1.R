# Data Science Specialization
# Exploratory Data Analysis
# plot1.R

# Data URL as declared by the PA instructions.
dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# Download file
download.file(dataURL, destfile="household_power_consumption.zip", method="curl")
# Unzip and read file
data <- read.table(
  unz("household_power_consumption.zip", "household_power_consumption.txt"),
  sep=";", header=T, strip.white=TRUE, stringsAsFactors = F, na.strings = "?"
)
# Subsetting data
subdata<- subset(data, (Date == "1/2/2007" | Date== "2/2/2007"))
# Removing original data
rm(data)

# Create plot
png("plot1.png", width=480, height=480)
hist(subdata$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
dev.off()
