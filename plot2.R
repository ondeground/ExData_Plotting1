plot2<-function() {
        
        ## This part of the code gets the dataframe from the web
        
        zipfile="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(zipfile,destfile="./house.zip",method="curl")
        unzip("house.zip",files="household_power_consumption.txt")
        
        ## This part of the code READS ONLY the data requested for the project. 
        ## With the grep function I was able to get the number of the row where 01/02/2007 started (00:00:00) 
        ## and the number of the row where 02/02/2007 ended 
        
        project<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880)
        variablenames<-read.table("household_power_consumption.txt",header=T,sep=";",nrows=1)
        
        ## This part of the code LABELS the variables 
        
        colnames(project)<-names(variablenames)
        
        ## This is my solution for merging the date and time columns and converted them to date & time class
        
        p<-paste(project$Date,project$Time)
        project$DateTime<-strptime(p,"%d/%m/%Y %H:%M:%S")
        
        ## This part of the code makes the plot on screen
        
        plot(project$DateTime,project$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
 
        ## This part of the code creates the plot2.png file 
        
        png(filename = "plot2.png",width=480,height=480,units="px")
        plot(project$DateTime,project$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
        dev.off()
        
}