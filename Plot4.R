if (!file.exists("exdata-data-household_power_consumption.zip"))
{
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
  filename = "household_power_consumption"
  unzip(paste0(filename,".zip"))
  file1 = paste0(filename,".txt")
}
filename = "exdata-data-household_power_consumption"
unzip(paste0(filename,".zip"))
file1 = list.files()[2]
a = read.table(file1,header = TRUE, sep = ";",na.strings = "?")
a$Date=as.Date(a$Date,"%d/%m/%Y")
c = a[a$Date >= "2007/2/1" & a$Date <= "2007/2/2",]
x=paste(c$Date,c$Time)
res=strptime(x, format="%Y-%m-%d %H:%M:%S")
res = as.POSIXct(res)
par(mfrow = c(2,2))
par(mar = c(4,4,2,2))
plot(c$Global_active_power~res,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
plot(c$Voltage~res,type = "l",xlab = "datetime",ylab = "Voltage")
plot(c$Sub_metering_1~res,type = "l",xlab = "",ylab = "Energy sub metering")
lines(c$Sub_metering_2~res,type = "l",xlab = "",ylab = "Energy sub metering",col = 'red')
lines(c$Sub_metering_3~res,type = "l",xlab = "",ylab = "Energy sub metering",col = 'blue')
legend("topright",col=c(1,'red','blue'),lwd=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
plot(c$Global_reactive_power~res,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
dev.copy(png,"Plot4.png")
dev.off()