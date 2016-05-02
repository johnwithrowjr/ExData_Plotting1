### R CODE START
### Creation of plot1.png (Histogram of Global Active Power)
### Dr. John R. Withrow, Jr.

#Set working directory
setwd("C:\\Users\\John\\Desktop\\Projects\\ExData_Plotting1")

#Read in data, using the semicolon as the divider between fields
#All fields are indicated as numeric except for the Date and Time fields, read in as character
#All fields containing a question mark (?) are understood as missing data and converted to NA
hpc <- read.csv("household_power_consumption.txt",sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")

#Convert Date field to Date format
hpc$Date <- as.Date(hpc$Date,format='%d/%m/%Y')

#Remove all but selected dates from dataset
hpc <- hpc[hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02",]

#Create an additional field called Datetime which contains full date and time information from both fields concatenated together
hpc$Datetime <- strptime(paste(hpc$Date,hpc$Time,sep=" "),"%Y-%m-%d %H:%M:%S")

#Create plot1.png
png("plot1.png",height=480,width=480)
par(mfrow=c(1,1))
with(hpc,hist(hpc$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power",cex.lab=0.8,cex.axis=0.8))
dev.off()

#Remove dataset
rm(hpc)

###END OF R CODE