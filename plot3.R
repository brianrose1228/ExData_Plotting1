

#Read in Data
  directory="C:\\Users\\F3NiXR0ZE\\Dropbox\\Coursera Data Science Specialization\\Exploratory Data Analysis\\Peer Assessment 1"
  setwd(directory)
  HPCData<-read.table("household_power_consumption.txt",sep=";", header=TRUE,stringsAsFactors=FALSE)

# Set ? to NA
  HPCData[ HPCData == "?" ] = NA
# Subset data for 2007-02-01 and 2007-02-02 dates
  HPCData$Date<-as.Date(HPCData$Date,"%d/%m/%Y")
  HPCData<-HPCData[HPCData$Date=='2007-02-01' |  HPCData$Date=='2007-02-02',]

#Create DateTime Column
  HPCData$DateTime<-strptime(paste(HPCData$Date,HPCData$Time), format = "%Y-%m-%d %H:%M:%S")

## Graph Plot3 
png(filename="plot3.png", height=480, width=480, 
      bg="white")

  
  plot(y=as.numeric(HPCData$Sub_metering_1) 
       ,x=HPCData$DateTime
       ,type="l"
       ,xlab=""
       ,ylab="Energy sub metering"
  )
  lines(y=as.numeric(HPCData$Sub_metering_2) 
        ,x=HPCData$DateTime
        ,col="red")
  lines(y=as.numeric(HPCData$Sub_metering_3) 
        ,x=HPCData$DateTime
        ,col="blue")
  legend("topright"
         ,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
         ,col=c("black","red","blue")
         ,lty=1
         ,cex=0.75
  )

# Turn off device driver (to flush output to png)
dev.off()

  
  