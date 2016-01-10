if (!file.exists("exdata-data-household_power_consumption.zip"))
{
     download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","exdata-data-household_power_consumption.zip")
     filename = "exdata-data-household_power_consumption"
     unzip(paste0(filename,".zip"))
     file1 = list.files()[2]
}else {
     filename = "exdata-data-household_power_consumption"
     unzip(paste0(filename,".zip"))
     file1 = "household_power_consumption.txt"
}
a = read.table(file1,header = TRUE, sep = ";",na.strings = "?")
a$Date=as.Date(a$Date,"%d/%m/%Y")
c = a[a$Date >= "2007/2/1" & a$Date <= "2007/2/2",]
x=paste(c$Date,c$Time)
res=strptime(x, format="%Y-%m-%d %H:%M:%S")
res = as.POSIXct(res)
plot.new()
plot(c$Global_active_power~res,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.copy(png,"Plot2.png")
dev.off()