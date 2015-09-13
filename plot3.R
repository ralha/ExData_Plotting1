dados<-read.csv("household_power_consumption.txt" ,sep = ";",dec = ".",na.strings = "?")
dados$Date <- as.Date(dados$Date,format="%d/%m/%Y")

dados_novos<-subset(dados, dados$Date =='2007-02-01'| dados$Date =='2007-02-02')


dados_novos$DateTime<-as.POSIXlt(paste(dados_novos$Date, dados_novos$Time), format="%Y-%m-%d %H:%M:%S")

with(dados_novos,{
plot(DateTime,Sub_metering_1, type = "l",ylab="Energy sub metering"
     ,xlab="")
lines(DateTime,Sub_metering_2, col = "red")
lines(DateTime,Sub_metering_3, col = "blue")
legend("topright",lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2"
                                                                    , "Sub_metering_3"))
})
dev.copy(png, file = "plot3.png",width=480,height=480)
dev.off()
