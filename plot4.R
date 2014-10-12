plot4 = function(){
  library("data.table")
  df<-fread('household_power_consumption.txt',sep=';',skip="1/2/2007",nrows=(60*24*2),data.table = FALSE)
  
  top<-fread('household_power_consumption.txt',header=TRUE,sep=';',nrows=0,na.strings='?')
  
  setnames(df,old=colnames(df),new=colnames(top))
  
  ##http://stackoverflow.com/questions/12303449/format-date-to-datetime-format-in-r
  
  df$Date <- strptime(paste(df$Date, format(df$Time, nsmall=2)), format='%d/%m/%Y %H:%M:%S')
  df <- df[,-2]
  
  png('plot4.png',480,480)
  par(mfrow = c(2,2),mar=c(5,5,2,2))
  plot(df$Date,df$Global_active_power,type="l",xlab = "",ylab ="Global Active Power (kilowatts)")
  
  
  plot(df$Date,df$Voltage,type = 'l',xlab="datetime",ylab = "Voltage",ylim=c(225,250))
  
  plot(df$Date,df$Sub_metering_1,type='l',ylab='',xlab='', ylim = c(0,40),yaxp = c(0,40,4),col='gray')
  par(new = TRUE)
  plot(df$Date,df$Sub_metering_2,type ='l',ylab='',xlab='',ylim = c(0,40),yaxp = c(0,40,4),col='red')
  par(new = TRUE)
  plot(df$Date,df$Sub_metering_3,type = 'l',xlab='',ylab="Energy sub metering", ylim = c(0,40),yaxp = c(0,40,4),col='blue')
  legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c('gray','red','blue'),bty='n',cex=0.5)
  
  plot(df$Date,df$Global_reactive_power,type = 'l',xlab='datetime',ylab='Global_reactive_power')
  
  dev.off()
  par(mfrow = c(1,1)) #reset the mode for further plotting
  
  
}