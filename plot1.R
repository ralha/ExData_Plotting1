dados<-read.csv("household_power_consumption.txt" ,sep = ";",dec = ".",na.strings = "?")
dados$Date <- as.Date(dados$Date,format="%d/%m/%Y")

dados_novos<-subset(dados, dados$Date =='2007-02-01'| dados$Date =='2007-02-02')

hist(dados_novos$Global_active_power,col="red",main="Global Active Power"
     ,xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png",width=480,height=480)
dev.off()
