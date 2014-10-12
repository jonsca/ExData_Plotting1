plot2 = function(){
  
  library("data.table")
  df<-fread('household_power_consumption.txt',sep=';',skip="1/2/2007",nrows=(60*24*2),data.table = FALSE)
  
  top<-fread('household_power_consumption.txt',header=TRUE,sep=';',nrows=0,na.strings='?')
  
  setnames(df,old=colnames(df),new=colnames(top))
  
  ##http://stackoverflow.com/questions/12303449/format-date-to-datetime-format-in-r

  df$Date <- strptime(paste(df$Date, format(df$Time, nsmall=2)), format='%d/%m/%Y %H:%M:%S')
  df <- df[,-2]
  
  png('plot2.png',480,480)
  
  plot(df[,1],df[,2],type="l",xlab = "",ylab ="Global Active Power (kilowatts)")

  dev.off()
  
}