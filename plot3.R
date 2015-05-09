# Data Science Specialization
# Exploratory Data Analysis
# plot3.R

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
png("plot3.png", width=480, height=480)
plot(subdata$Datetime, subdata$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(subdata$Datetime, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$Datetime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()