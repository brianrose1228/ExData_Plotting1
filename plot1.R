#Code Assumes that data from the following url is unzipped and in the working directory set in the directory variable below
# url:  https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

#Read in Data
  directory="C:\\Users\\BRose\\Documents\\My Dropbox\\Coursera Data Science Specialization\\Exploratory Data Analysis\\Peer Assessment 1"
  setwd(directory)
  HPCData<-read.table("household_power_consumption.txt",sep=";", header=TRUE,stringsAsFactors=FALSE)

# Set ? to NA
  HPCData[ HPCData == "?" ] = NA
# Subset data for 2007-02-01 and 2007-02-02 dates
  HPCData$Date<-as.Date(HPCData$Date,"%d/%m/%Y")
  HPCData<-HPCData[HPCData$Date=='2007-02-01' |  HPCData$Date=='2007-02-02',]


## Graph Plot1 Histogram
png(filename="plot1.png", height=480, width=480, 
      bg="white")
hist(as.numeric(HPCData$Global_active_power)
    ,breaks=11
    ,main="Global Active Power"
    ,xlab="Global Active Power (kilowatts)"
    ,col="red")

# Turn off device driver (to flush output to png)
dev.off()

