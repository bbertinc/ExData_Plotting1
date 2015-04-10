## plot2.R

## Read The Full Data into a Data Frame
epcdata <- read.csv("./data/household_power_consumption.txt",sep=";",
                    na.strings="?")

## Extract data for 1st and 2nd of February 2007
usedata <- subset(epcdata, Date == "1/2/2007" | Date == "2/2/2007")

## Convert Date strings to date objects
usedata$Date <- as.Date(usedata$Date,format="%d/%m/%Y")
fulldates <- strptime(paste(usedata$Date,usedata$Time),
                      format="%Y-%m-%d %H:%M:%S")

## Plot Power against Time
with(usedata, plot(fulldates,Global_active_power,type="n",
                   xlab="",ylab="Global Active Power (kilowatts)"))
lines(fulldates,usedata$Global_active_power)

## Save as a PNG File
dev.copy(png,file="plot2.png",width = 480, height = 480, units = "px")
dev.off()