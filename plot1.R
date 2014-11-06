plot1 = function(){
##Skip down until the row is equal to "1/2/2007" (since dd/mm/yyyy)
  library("data.table")
   
  df<-fread('household_power_consumption.txt',sep=';',skip="1/2/2007",nrows=(60*24*2),data.table = FALSE)

  top<-fread('household_power_consumption.txt',header=TRUE,sep=';',nrows=0,na.strings='?')

  setnames(df,old=colnames(df),new=colnames(top)) ## Might be a better way to do this
  png('plot1.png',480,480)
  hist(df[,3],main='Global Active Power',xlab = "Global Active Power (kilowatts)",ylab="Frequency",col="red")
  dev.off()
}

