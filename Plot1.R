## Plot 1
## Read first row of data file to get colmn names
hp0<-read.csv("household_power_consumption.txt",sep=";", nrows=1)
## Read only rows with dates 1/2/2007 and 2/2/2007
hps<-read.csv("household_power_consumption.txt",sep=";", skip = 66638,nrows=2880)
## Copy column names from first data frame
colnames(hp)<-colnames(hp0)
## Set global margins
par(mfcol = c(1,1))
par(mar = c(5,5,5,5))
## Get maximum x-axis vale
max_x<-4.0#max(as.numeric(Global_active_power)/1000)
## Create plot
with(hps,hist(as.numeric(Global_active_power)/1000,xlab="Global Active Power (kilowatts)",xlim=c(0,max_x),col="red",main="Global Active Power",xaxt='n'))
## Add y-axis ticks
axis(1, las=1, at=2*0:max_x)
## Export plot to png file
dev.copy(png,file="Plot1.png",width=480,height=480,res=72)
## Close file device
dev.off()
