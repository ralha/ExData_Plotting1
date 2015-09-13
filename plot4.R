dados<-read.csv("household_power_consumption.txt" ,sep = ";",dec = ".",na.strings = "?")
dados$Date <- as.Date(dados$Date,format="%d/%m/%Y")

dados_novos<-subset(dados, dados$Date =='2007-02-01'| dados$Date =='2007-02-02')


dados_novos$DateTime<-as.POSIXlt(paste(dados_novos$Date, dados_novos$Time), format="%Y-%m-%d %H:%M:%S")


par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(dados_novos,{
  plot(DateTime, Global_active_power,type="l", ylab="Global Active Power",xlab="")
  plot(DateTime, Voltage,type="l", ylab="Voltage",xlab="datetime")
  plot(DateTime,Sub_metering_1,type = "l",ylab="Energy sub metering",xlab="")
  lines(DateTime,Sub_metering_2, col = "red")
  lines(DateTime,Sub_metering_3, col = "blue")
  legend("topright",lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2"
                                                                      , "Sub_metering_3")
         , bty="n",cex=0.6)
  
  plot(DateTime,Global_reactive_power,type="l",xlab="datetime")
})
dev.copy(png, file = "plot4.png",width=480,height=480)
dev.off()
