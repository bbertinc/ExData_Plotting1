## plot3.R

## Read The Full Data into a Data Frame
epcdata <- read.csv("./data/household_power_consumption.txt",sep=";",
                    na.strings="?")

## Extract data for 1st and 2nd of February 2007
usedata <- subset(epcdata, Date == "1/2/2007" | Date == "2/2/2007")

## Convert Date strings to date objects
usedata$Date <- as.Date(usedata$Date,format="%d/%m/%Y")
fulldates <- strptime(paste(usedata$Date,usedata$Time),
                      format="%Y-%m-%d %H:%M:%S")

## Initialize plot parameters
par(mar=c(6,4.5,5,2.5),cex=0.75)

## Plot Power against Time
with(usedata, plot(fulldates,Sub_metering_1,type="n",
                   xlab="",ylab="Energy sub metering"))
lines(fulldates,usedata$Sub_metering_1)
lines(fulldates,usedata$Sub_metering_2,col="red")
lines(fulldates,usedata$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       y.intersp=0.6)


## Save as a PNG File
dev.copy(png,file="plot3.png",width = 480, height = 480, units = "px")
dev.off()