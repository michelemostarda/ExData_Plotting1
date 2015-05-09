# Data Science Specialization
# Exploratory Data Analysis
# plot2.R

# Setup environment to generate correct day labels.
Sys.setlocale("LC_TIME", "en_US.UTF-8")

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

# Parsing data
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
# Adding datetime column
subdata$Datetime <- as.POSIXct(paste(subdata$Date, subdata$Time))

# Create plot
png("plot2.png", width=480, height=480)
plot(subdata$Datetime, subdata$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()
