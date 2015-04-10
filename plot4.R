## plot4.R

## Read The Full Data into a Data Frame
epcdata <- read.csv("./data/household_power_consumption.txt",sep=";",
                    na.strings="?")

## Extract data for 1st and 2nd of February 2007
usedata <- subset(epcdata, Date == "1/2/2007" | Date == "2/2/2007")

## Convert Date strings to date objects
usedata$Date <- as.Date(usedata$Date,format="%d/%m/%Y")
fulldates <- strptime(paste(usedata$Date,usedata$Time),
                      format="%Y-%m-%d %H:%M:%S")

## Initialize multi-plot parameters
par(mfrow=c(2,2), mar=c(5,4.5,4,2), cex=0.65)

## Plot [1,1]
with(usedata, plot(fulldates,Global_active_power,type="n",
                   xlab="",ylab="Global Active Power"))
lines(fulldates,usedata$Global_active_power)

## Plot [1,2]
with(usedata, plot(fulldates,Voltage,type="n",
                   xlab="datetime"))
lines(fulldates,usedata$Voltage)

## Plot [2,1]
with(usedata, plot(fulldates,Sub_metering_1,type="n",
                   xlab="",ylab="Energy sub metering"))
lines(fulldates,usedata$Sub_metering_1)
lines(fulldates,usedata$Sub_metering_2,col="red")
lines(fulldates,usedata$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n")

## Plot [2,2]
with(usedata, plot(fulldates,Global_reactive_power,type="n",
                   xlab="datetime"))
lines(fulldates,usedata$Global_reactive_power)

## Save as a PNG File
dev.copy(png,file="plot4.png",width = 480, height = 480, units = "px")
dev.off()
