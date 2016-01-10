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
c = a[a$Date >= "2007/2/1" & a$Date <= "2007/2/3",]
plot.new()
hist(c$Global_active_power,main = "Global Active Power",col = "red",xlab="Global Active Power (kilowatts)")
dev.copy(png,"Plot1.png")
dev.off()
