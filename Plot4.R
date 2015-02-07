## Plot 4
hp0<-read.csv("household_power_consumption.txt",sep=";", nrows=1)
## Read only rows with dates 1/2/2007 and 2/2/2007
hp<-read.csv("household_power_consumption.txt",sep=";", skip = 66638,nrows=2880)
## Copy column names from first data frame
colnames(hp)<-colnames(hp0)
## Set global margins
par(mfcol = c(2,2))
par(mar = c(5,5,5,5))
## Get maximum y-axis vale
max_y<-max(as.numeric(hps$Global_active_power))/1000
## Create plot frame
with(hps,plot(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(Global_active_power),xlab="",ylab="Global Active Power",type="n"))
## Add line
with(hps,lines(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(Global_active_power),col="black",ylim=c(0,max_y)))

## Get maximum y-axis vale
max_y<-max(c(as.numeric(hps$Sub_metering_1),as.numeric(hps$Sub_metering_2),as.numeric(hps$Sub_metering_3)))
## Create plot frame
with(hps,plot(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(hps$Sub_metering_1),xlab="",ylab="Energy sub metering",type="n",yaxt='n'))
## Add y-axis ticks
axis(2, las=1, at=10*0:max_y)
## Add lines
with(hps,lines(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(hps$Sub_metering_1),col="black",ylim=c(0,max_y)))
with(hps,lines(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(hps$Sub_metering_2),col="red",ylim=c(max_y)))
with(hps,lines(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(hps$Sub_metering_3),col="blue",ylim=c(0,max_y)))
## Set line coors for legend
plot_colors <- c("black","red","blue")
## Create legend
legend("topright",names(hps)[7:9], y.intersp=0.5, xjust=1, cex=0.5,lty=c(7,7,7),col=plot_colors,bty="n") 

## Get maximum y-axis vale
max_y<-max(as.numeric(hps$Voltage))
## Create plot frame
with(hps,plot(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(Voltage),xlab="datetime",ylab="Voltage",type="n"))
## Add line
with(hps,lines(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(Voltage),col="black",ylim=c(0,max_y)))

## Get maximum y-axis vale
max_y<-max(as.numeric(hps$Global_reactive_power))/1000
## Create plot frame
with(hps,plot(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(Global_reactive_power)/1000,xlab="datetime",ylab=names(hps[4]),type="n"))
## Add line
with(hps,lines(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(Global_reactive_power)/1000,col="black",ylim=c(0,max_y)))
## Export plot to png file
dev.copy(png,file="Plot4.png",width=480,height=480,res=72)
## Close file device
dev.off()