plot3<-function() {
        zipfile="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(zipfile,destfile="./house.zip",method="curl")
        unzip("house.zip",files="household_power_consumption.txt")
        project<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880)
        variablenames<-read.table("household_power_consumption.txt",header=T,sep=";",nrows=1)
        colnames(project)<-names(variablenames)
        p<-paste(project$Date,project$Time)
        project$DateTime<-strptime(p,"%d/%m/%Y %H:%M:%S")
        plot(project$DateTime,project$Sub_metering_1, type="n",ylab="Energy sub metering",xlab="")
        points(project$DateTime,project$Sub_metering_1,typ="l")
        points(project$DateTime,project$Sub_metering_2,col="red",typ="l")
        points(project$DateTime,project$Sub_metering_3,col="blue",typ="l")
        legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),pch="—")
        png(filename = "plot3.png",width=480,height=480,units="px")
        plot(project$DateTime,project$Sub_metering_1, type="n",ylab="Energy sub metering",xlab="")
        points(project$DateTime,project$Sub_metering_1,typ="l")
        points(project$DateTime,project$Sub_metering_2,col="red",typ="l")
        points(project$DateTime,project$Sub_metering_3,col="blue",typ="l")
        legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),pch="—")
        dev.off()
        
        
}