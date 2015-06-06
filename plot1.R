plot1<-function() {
        zipfile="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(zipfile,destfile="./house.zip",method="curl")
        unzip("house.zip",files="household_power_consumption.txt")
        project<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880)
        variablenames<-read.table("household_power_consumption.txt",header=T,sep=";",nrows=1)
        colnames(project)<-names(variablenames)
        hist(project$Global_active_power,col="red",xlab= "Global Active Power (kilowatts)",main="Global Active Power")
        png(filename = "plot1.png",width=480,height=480,units="px")
        hist(project$Global_active_power,col="red",xlab= "Global Active Power (kilowatts)",main="Global Active Power")
        dev.off()
}