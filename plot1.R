
##Skip down until the row is equal to "1/2/2007" (since dd/mm/yyyy)
df<-fread('household_power_consumption.txt',sep=';',skip="1/2/2007",nrows=(60*24*2))

top<-fread('household_power_consumption.txt',header=TRUE,sep=';',nrows=0,na.strings='?')

setnames(df,old=colnames(df),new=colnames(top)) ## Might be a better way to do this



