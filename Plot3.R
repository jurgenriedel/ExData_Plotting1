## Plot 3
hp0<-read.csv("household_power_consumption.txt",sep=";", nrows=1)
#hps<-subset(hd,Date=="1/2/2007"|Date=="2/2/2007")
## Read only rows with dates 1/2/2007 and 2/2/2007
hps<-read.csv("household_power_consumption.txt",sep=";", skip = 66638,nrows=2880)
## Copy column names from first data frame
colnames(hp)<-colnames(hp0)
## Set global margins
par(mfcol = c(1,1))
par(mar = c(5,5,5,5))
max_y<-max(as.numeric(hps$Voltage))
max_y<-max(c(as.numeric(hps$Sub_metering_1),as.numeric(hps$Sub_metering_2),as.numeric(hps$Sub_metering_3)))
## Create plot
with(hps,plot(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(hps$Sub_metering_1),xlab="",ylab="Energy sub metering",type="n",yaxt='n'))
## Add y-axis ticks
axis(2, las=1, at=10*0:max_y)
## Add lines
with(hps,lines(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(hps$Sub_metering_1),col="black",ylim=c(0,max_y)))
with(hps,lines(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(hps$Sub_metering_2),col="red",ylim=c(max_y)))
with(hps,lines(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(hps$Sub_metering_3),col="blue",ylim=c(0,max_y)))
#S# Set line colors for legend
plot_colors <- c("black","red","blue")
## Create legend
legend("topright",paste(names(hps)[7:9],"   "), cex=0.6,lty=c(7,7,7),col=plot_colors,xjust = .5, yjust = .5) 
## Export plot to png file
dev.copy(png,file="Plot3.png",width=480,height=480,res=72)
## Close file device
dev.off()
