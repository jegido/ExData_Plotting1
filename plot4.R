### EDA: Course Project 1 - plot4.R

# Load data:
	pow <- read.table("household_power_consumption.txt",header=T,
			na.string="?",sep=";")
	dim(pow); head(pow)

	pow$Date <- as.Date(pow$Date,"%d/%m/%Y")
	
# Only 01&02/02/2007
	po1 <- pow[pow$Date=="2007-02-01" | pow$Date=="2007-02-02", ]
	dim(po1); head(po1)
	
# Add 'datetime' column
	po1$datetime <- strptime(paste(po1$Date,po1$Time), "%Y-%m-%d %H:%M:%S")

# Plot 4
	Sys.setlocale(locale="US_US")		# to xlabel to english
	par(mfcol=c(2,2))
	# 1.1
	with(po1, {
	plot(datetime,Global_active_power,type="n",
			xlab="",
			ylab="Global Active Power")
	lines(datetime,Global_active_power)
	} )
	# 2.1
	with(po1, {
	plot(datetime,Sub_metering_1,type="n",
			xlab="", ylab="Energy sub metering")
	lines(datetime,Sub_metering_1)
	lines(datetime,Sub_metering_2,col="red")
	lines(datetime,Sub_metering_3,col="blue")
	legend("topright", lty = c(1, 1, 1),  col=c("black","red","blue"),
			bty="n",
			cex=0.9, legend=(colnames(po1[7:9])))
	} )
	# 1.2
	with(po1, {
	plot(datetime,Voltage,type="n")
	lines(datetime,Voltage)
	} )
	# 2.2
	with(po1, {
	plot(datetime,Global_active_power,type="n")
	lines(datetime,Global_active_power)
	} )
	
	Sys.setlocale(locale="")
	par(mfcol=c(1,1))
	
# To save the plot to a PNG file
	# Default png: width = 480, height = 480, units = "px", bg = "white"
	dev.copy(png, file="plot4.png")
	dev.off()
	