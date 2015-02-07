## Plot 2
hp0<-read.csv("household_power_consumption.txt",sep=";", nrows=1)
## Read only rows with dates 1/2/2007 and 2/2/2007
hp<-read.csv("household_power_consumption.txt",sep=";", skip = 66638,nrows=2880)
## Copy column names from first data frame
colnames(hp)<-colnames(hp0)
## Set global margins
par(mfcol = c(1,1))
par(mar = c(5,5,5,5))
## Create plot frame
with(hps,plot(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(Global_active_power)/1000,xlab="",ylab="Global Active Power (kilowatts)",col="black",main="Global Active Power",type="n"))
## Add line plot
with(hps,lines(strptime(paste(hps$Date, hps$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(Global_active_power)/1000))
## Export plot to png file
dev.copy(png,file="Plot2.png",width=480,height=480,res=72)
dev.off()