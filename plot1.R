## plot1.R

## Read The Full Data into a Data Frame
epcdata <- read.csv("./data/household_power_consumption.txt",sep=";",
                    na.strings="?")

## Extract data for 1st and 2nd of February 2007
usedata <- subset(epcdata, Date == "1/2/2007" | Date == "2/2/2007")

## Initialize plot parameters
par(mar=c(6,4.5,3.5,2),cex=0.75)

## Plot Histogram of Global Active Power
with(usedata, hist(Global_active_power, col="red",main="Global Active Power",
                   xlab="Global Active Power (kilowatts)"))

## Save as a PNG File
dev.copy(png,file="plot1.png",width = 480, height = 480, units = "px")
dev.off()