### EDA: Course Project 1 - plot2.R

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

# Plot 2
	Sys.setlocale(locale="US_US")		# to xlabel to english
	with(po1, {
	plot(datetime,Global_active_power,type="n",
			xlab="",
			ylab="Global Active Power (kilowatts)")
	lines(datetime,Global_active_power)
	} )
	Sys.setlocale(locale="")
	
# To save the plot to a PNG file
	# Default png: width = 480, height = 480, units = "px", bg = "white"
	dev.copy(png, file="plot2.png")
	dev.off()
	