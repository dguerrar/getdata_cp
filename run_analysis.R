#run_analysis.R 

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