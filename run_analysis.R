################################################################################
## This script collects and prepare a tidy dataset from the raw data "Human
## Activity Recognition Using Smartphones Dataset", available at 
## "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## 
##
## Input: the raw dataset, downloaded by the script (partA)
## Output: the tidy data set with mean of each measurements (mean and std) pet activity and subject
## this output is available in R (tidydataset2) and in a text file "tidydataset2.txt" in R working directory
##
## Actions to be performed to get the tidy data set: 
## Just launch run_analysis.R in R
## (the downloading of the data set is performed in the first part of the script)
##
## Quick description of each part of the script:
## A  - Collect > download the raw dataset and put each data files into "rawdata_xxx" tables
## B1 - cliping  raw datas into one dataset
## B2 - Extract only mean() and std() measurements
## B3 - Set descriptive activity names to name the activities in the data set
## B4 - Set descriptive variable names
## B5 - Creates a second, independent tidy data set with the average of each variable
##      for each activity and each subject
##


################################################################################
## Part A - Collect
##
## This part download the raw dataset and put each data files into 
## "rawdata_xxx" tables, which will be used in next part
##

url_data_zip="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(url_data_zip,temp)

rawdata_test_y <- read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"))
rawdata_test_x <- read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt"))
rawdata_test_subject <- read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"))
rawdata_train_y <- read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"))
rawdata_train_x <- read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"))
rawdata_train_subject <- read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"))
rawdata_features <- read.table(unz(temp, "UCI HAR Dataset/features.txt"))
rawdata_activitylabels <- read.table(unz(temp, "UCI HAR Dataset/activity_labels.txt"))

unlink(temp)



################################################################################
## Part B - Merge and clean
##
## This part merges and cleans "rawdata_xxx" tables into tidy tables
##

## B1 - Merging into one dataset
## First: for both test and train data, we merge the column of activity class (y),
##        the column of the subject (subject), and the columns of values (x)
## Second: we merge test and train data rows together
## Third: we add the column labels (features) + the columns labels for "activity
##        class" and "subjects" at the first 2 places

test <- cbind(rawdata_test_y,rawdata_test_subject,rawdata_test_x)
train <- cbind(rawdata_train_y,rawdata_train_subject,rawdata_train_x)

mergeddata <- rbind(test,train)

columnslabels <- c("activityClass","subject",matrix(rawdata_features[,2],1,nrow(rawdata_features)))
colnames( mergeddata ) <- columnslabels 


## B2 - Extract only mean() and std() measurements
## 
## we make a logical vector on the columns we want to keep : 
## - we keep the colums with "mean()" and "std()" in columnslabels
## - and keep the first 2 columns "activity class" and "subject"
## and we apply this logical vector to make the extract
##

logical_vector <- grepl("mean()",columnslabels,fixed = TRUE)|grepl("std()",columnslabels,fixed = TRUE)|c(rep(TRUE,2),rep(FALSE,length(columnslabels)-2))

extracteddata <- mergeddata[,logical_vector]


## B3 - Set descriptive activity names to name the activities in the data set
## 
## we get the descriptive activity labels from rawdata_activitylabels and replace them
##

activitylabels <- extracteddata[,1]
for (i in seq_len(nrow(rawdata_activitylabels)))
{
        activitylabels <- gsub(rawdata_activitylabels[i,1],rawdata_activitylabels[i,2],activitylabels,fixed="TRUE")
}
extracteddata[,1] <- activitylabels

## (
## we could have make a merging but I have decided to do differently to not manage another column
## extracteddata2 <- merge(extracteddata,rawdata_activitylabels,by.x="activity class",by.y=1)
## )


## B4 - Set descriptive variable names
## 
## we make a set of reimplacements to make the columnslabels more descriptive
## with lowerCamelCase convention
## The matchings have been found in features_info.txt
## and by analysing the current column names
##

columnslabels_extracteddata <- colnames( extracteddata )


columnslabels_extracteddata<-gsub("^t","time",columnslabels_extracteddata)
columnslabels_extracteddata<-gsub("^f","frequency",columnslabels_extracteddata)

columnslabels_extracteddata<-gsub("Acc","Acceleration",columnslabels_extracteddata,fixed="TRUE")
columnslabels_extracteddata<-gsub("Gyro","Gyroscope",columnslabels_extracteddata,fixed="TRUE")
columnslabels_extracteddata<-gsub("Mag","Magnitude",columnslabels_extracteddata,fixed="TRUE")

columnslabels_extracteddata<-gsub("mean","Mean",columnslabels_extracteddata,fixed="TRUE")
columnslabels_extracteddata<-gsub("std","StandardDeviation",columnslabels_extracteddata,fixed="TRUE")
columnslabels_extracteddata<-gsub("BodyBody","Body",columnslabels_extracteddata,fixed="TRUE")

columnslabels_extracteddata<-gsub("-","",columnslabels_extracteddata,fixed="TRUE")
columnslabels_extracteddata<-gsub("()","",columnslabels_extracteddata,fixed="TRUE")


colnames( extracteddata ) <- columnslabels_extracteddata


## B5 - Creates a second, independent tidy data set with the average of each variable
## for each activity and each subject
## 
##

library(reshape2)

melteddata <- melt(extracteddata,id=columnslabels_extracteddata[1:2],measure.vars=columnslabels_extracteddata[3:length(columnslabels_extracteddata)])
tidydataset2 <- dcast(melteddata,activityClass + subject ~ variable,mean)

write.table(tidydataset2,"tidydataset2.txt",row.name=FALSE)
message(">>> Finished: tidydataset2.txt created <<<")
