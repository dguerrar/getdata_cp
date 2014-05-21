getdata_cp
==========

Course Project on Coursera's Getting and Cleaning Data

### Files Readed:

* activity_labels.txt
* features.txt
* Files for "test"
  * subject_test.txt
  * y_test.txt
  * X_test.txt

* Files for "train"
  * subject_train.txt
  * y_train.txt
  * X_train.txt
  
  
### OutputFiles
* final.csv       :*final and tidy data*

### Data.frames with readed data

* activity_labels : *data readed from file "activity_labels.txt" in CSV format*
* features        : *data readed from file "features.txt" in CSV format*
* subject_test    : *data readed from file "subject_test.txt" in CSV format*
* y_test          : *data readed from file "y_test.txt" in CSV format*
* x_test          : *data readed from file "x_test.txt" in CSV format, with 16 characters width (each column) and 561 columns*
* subject_train   : *data readed from file "subject_train.txt" in CSV format*
* y_train         : *data readed from file "y_train.txt" in CSV format*
* x_train         : *data readed from file "X_train.txt" in CSV format with 16 characters width (each column) and 561 columns*


### Variables
* test            :*all data from "test" merged: subject_test,y_test,x_test*
* train           :*all data from "train" merged: subject_train,y_train,x_train*
* colNamesT       :*"feature" names*
* sensorsToRead  :*names of the "sensors" from mean() and std()*

* set1            :*join "test" and "train" data.frames*
* set2            :*getting relevant traininigs and tests from dataframe "set1", with colnames "sensorsToRead"
  * set22         :*getting "y" and "subject" columns from "set1"* 
  * set23         :*merge "set22" and "set2" in order to adquire a data.frame with relevant sensors, subjects and featues* 
* set3            :*from "set23" replace index "y" with its "feature" value*

* final           :*final TIDY and clean data.frame*



### Functions
* doTheSummaryze

Calculates the mean for each column by feature and subject




SCRIPT
===================================
```
library(plyr)
#auxiliar function tu sumarize by training
doTheSummaryze<-function(data,colForMean, colForGrouping){
  
  
  datac <- ddply(set3, .(subject,V2),.drop=TRUE,
                 .fun = function(xx, col) {
                   mean = mean   (xx[[col]], na.rm=TRUE)
                 }
                 ,colForMean
  )

  return (datac)
}



#read activity labels
activity_labels<-read.csv("./activity_labels.txt",header=FALSE,sep=" ")
#read_features
features<-read.csv("./features.txt",header=FALSE,sep=" ")

#read_from_tests
#read subject_test
subject_test<-read.csv("./test/subject_test.txt",header=FALSE)

#read y_test
y_test<-read.csv("./test/y_test.txt",header=FALSE)

#read x_test --> 2950 lineas
x_test<-read.fwf("./test/X_test.txt",header=FALSE,width=rep(16,561),buffersize=10,n=3000)


#read trainings
#read subject_test
subject_train<-read.csv("./train/subject_train.txt",header=FALSE)

#read y_test
y_train<-read.csv("./train/y_train.txt",header=FALSE)

#read x_test--> 561  columnas mas o menos de 16 caracteres--> 7900 linieas
x_train<-read.fwf("./train/X_train.txt",header=FALSE,width=rep(16,561),buffersize=10,n=8000)

#Merge Trains & test in SET1
#1str, merge subjecsts and feature
train<-cbind(x_train,y_train,subject_train)
test<-cbind(x_test,y_test,subject_test)
#join the 2 data.frames
set1<-rbind(train,test)


#add labels to columns
colNamesT<-features$V2
colnames(set1)<-colNamesT
colnames(set1)[562]<-"y"
colnames(set1)[563]<-"subject"

#getting the columns names relevent mean() and std()
#
sensorsToRead<-names(set1)[grep('.*(mean\\(\\)|std\\(\\))+.*',names(set1))] 

#getting relevant traininigs and tests
set2<-subset(set1,select=sensorsToRead)

#add "y" &  "subject"
set22<-subset(set1,select=c("y","subject"))
set23<-cbind(set2,set22)

#replace column "Y" with the activity name

set3<-merge(set23,activity_labels,by.x="y",by.y="V1")

#final merge of all data
final<-NULL
for(i in 1:length(sensorsToRead)){
  newColumn<-sensorsToRead[i]
  acc<-doTheSummaryze(set3,newColumn,c("subject","V2"))
  colnames(acc)[colnames(acc)=="V1"] <-newColumn

  if (i==1){
    final<-acc
  }else{   
    final<-cbind(final,subset(acc,select=newColumn))
  }
  
}
#rename column V2 to feature
colnames(final)[colnames(final)=="V2"] <-"feature"
#write to file
write.csv(final, file = "./final.txt")
```