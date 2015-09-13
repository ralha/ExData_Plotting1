dados<-read.csv("household_power_consumption.txt" ,sep = ";",dec = ".",na.strings = "?")
dados$Date <- as.Date(dados$Date,format="%d/%m/%Y")

dados_novos<-subset(dados, dados$Date =='2007-02-01'| dados$Date =='2007-02-02')


dados_novos$DateTime<-as.POSIXlt(paste(dados_novos$Date, dados_novos$Time), format="%Y-%m-%d %H:%M:%S")

plot(x=dados_novos$DateTime,y=dados_novos$Global_active_power,type="l"
     ,ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png, file = "plot2.png",width=480,height=480)
dev.off()
