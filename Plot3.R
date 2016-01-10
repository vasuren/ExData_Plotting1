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
plot(c$Sub_metering_1~res,type = "l",xlab = "",ylab = "Energy sub metering",legend('topright',legend = "Sub_metering_1"))
lines(c$Sub_metering_2~res,type = "l",xlab = "",ylab = "Energy sub metering",col = 'red')
lines(c$Sub_metering_3~res,type = "l",xlab = "",ylab = "Energy sub metering",col = 'blue')
legend("topright",col=c(1,'red','blue'),lwd=1,legend=c("Sub_metering_1","Sub_metering_2","\nSub_metering_3"), bty="n")
dev.copy(png,"Plot3.png")
dev.off()