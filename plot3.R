source('config.R')
clean_data <- get_clean_data()
png(filename = 'plot3.png')
with(clean_data, {
  plot(Time, Sub_metering_1, type='n', ylab='Energi sub metering')
})
col_sub_1 <- '#000000'
col_sub_2 <- '#FF2500'
col_sub_3 <- '#0433FF'
with(clean_data, {
  lines(Time, Sub_metering_1, col=col_sub_1)
  lines(Time, Sub_metering_2, col=col_sub_2)
  lines(Time, Sub_metering_3, col=col_sub_3)
})
legend("topright", lty=c(1,1), col=c(col_sub_1,col_sub_2,col_sub_3), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()