Getting and Cleaning Data
===============================================

Peer Assessments
-----------------------------
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


### Field List 
 
* "subject"                     
* "feature"                     
* "tBodyAcc-mean()-X"          
* "tBodyAcc-mean()-Y"           
* "tBodyAcc-mean()-Z"           
* "tBodyAcc-std()-X"           
* "tBodyAcc-std()-Y"            
* "tBodyAcc-std()-Z"            
* "tGravityAcc-mean()-X"       
* "tGravityAcc-mean()-Y"        
* "tGravityAcc-mean()-Z"        
* "tGravityAcc-std()-X"        
* "tGravityAcc-std()-Y"         
* "tGravityAcc-std()-Z"         
* "tBodyAccJerk-mean()-X"      
* "tBodyAccJerk-mean()-Y"       
* "tBodyAccJerk-mean()-Z"       
* "tBodyAccJerk-std()-X"       
* "tBodyAccJerk-std()-Y"        
* "tBodyAccJerk-std()-Z"        
* "tBodyGyro-mean()-X"         
* "tBodyGyro-mean()-Y"          
* "tBodyGyro-mean()-Z"          
* "tBodyGyro-std()-X"          
* "tBodyGyro-std()-Y"           
* "tBodyGyro-std()-Z"           
* "tBodyGyroJerk-mean()-X"     
* "tBodyGyroJerk-mean()-Y"      
* "tBodyGyroJerk-mean()-Z"      
* "tBodyGyroJerk-std()-X"      
* "tBodyGyroJerk-std()-Y"       
* "tBodyGyroJerk-std()-Z"       
* "tBodyAccMag-mean()"         
* "tBodyAccMag-std()"           
* "tGravityAccMag-mean()"       
* "tGravityAccMag-std()"       
* "tBodyAccJerkMag-mean()"      
* "tBodyAccJerkMag-std()"       
* "tBodyGyroMag-mean()"        
* "tBodyGyroMag-std()"          
* "tBodyGyroJerkMag-mean()"     
* "tBodyGyroJerkMag-std()"     
* "fBodyAcc-mean()-X"           
* "fBodyAcc-mean()-Y"           
* "fBodyAcc-mean()-Z"          
* "fBodyAcc-std()-X"            
* "fBodyAcc-std()-Y"            
* "fBodyAcc-std()-Z"           
* "fBodyAccJerk-mean()-X"       
* "fBodyAccJerk-mean()-Y"       
* "fBodyAccJerk-mean()-Z"      
* "fBodyAccJerk-std()-X"        
* "fBodyAccJerk-std()-Y"        
* "fBodyAccJerk-std()-Z"       
* "fBodyGyro-mean()-X"          
* "fBodyGyro-mean()-Y"          
* "fBodyGyro-mean()-Z"         
* "fBodyGyro-std()-X"           
* "fBodyGyro-std()-Y"           
* "fBodyGyro-std()-Z"          
* "fBodyAccMag-mean()"          
* "fBodyAccMag-std()"           
* "fBodyBodyAccJerkMag-mean()" 
* "fBodyBodyAccJerkMag-std()"   
* "fBodyBodyGyroMag-mean()"     
* "fBodyBodyGyroMag-std()"     
* "fBodyBodyGyroJerkMag-mean()" 
* "fBodyBodyGyroJerkMag-std()" 