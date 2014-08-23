#CodeBook tidataset2

This tidy data set (tidydataset2) is about Human Activity Recognition Using Smartphones
It summarizes per activity and subject the average values of some measurements, collected
from the recordings of 30 subjects performing activities of daily living (ADL)
while carrying a waist-mounted smartphone with embedded inertial sensors


## Variables

### activityClass
* type: string of length 180
* unit: na
* definition: activity performed by the subject when taking the measurement
* values: 6 different possible values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

### subject
* type: integer
* definition: id of the subject on which the measurement was taken
* unit: na
* values: 30 different possible values, from 1 to 30

### Other columns: averge measurements (see the list below)
* type: numeric
* definition: average measurement for this activity class and this subject. The column names describes what the measurement is about.
* unit: na (initial measurements have been normalized and bounded within [-1,1])
* values: range [-1,1] (initial measurements have been normalized and bounded within [-1,1])


List of average measurements per activity class and subject

* timeBodyAccelerationMeanX
* timeBodyAccelerationMeanY
* timeBodyAccelerationMeanZ
* timeBodyAccelerationStandardDeviationX
* timeBodyAccelerationStandardDeviationY
* timeBodyAccelerationStandardDeviationZ
* timeGravityAccelerationMeanX
* timeGravityAccelerationMeanY
* timeGravityAccelerationMeanZ
* timeGravityAccelerationStandardDeviationX
* timeGravityAccelerationStandardDeviationY
* timeGravityAccelerationStandardDeviationZ
* timeBodyAccelerationJerkMeanX
* timeBodyAccelerationJerkMeanY
* timeBodyAccelerationJerkMeanZ
* timeBodyAccelerationJerkStandardDeviationX
* timeBodyAccelerationJerkStandardDeviationY
* timeBodyAccelerationJerkStandardDeviationZ
* timeBodyGyroscopeMeanX
* timeBodyGyroscopeMeanY
* timeBodyGyroscopeMeanZ
* timeBodyGyroscopeStandardDeviationX
* timeBodyGyroscopeStandardDeviationY
* timeBodyGyroscopeStandardDeviationZ
* timeBodyGyroscopeJerkMeanX
* timeBodyGyroscopeJerkMeanY
* timeBodyGyroscopeJerkMeanZ
* timeBodyGyroscopeJerkStandardDeviationX
* timeBodyGyroscopeJerkStandardDeviationY
* timeBodyGyroscopeJerkStandardDeviationZ
* timeBodyAccelerationMagnitudeMean
* timeBodyAccelerationMagnitudeStandardDeviation
* timeGravityAccelerationMagnitudeMean
* timeGravityAccelerationMagnitudeStandardDeviation
* timeBodyAccelerationJerkMagnitudeMean
* timeBodyAccelerationJerkMagnitudeStandardDeviation
* timeBodyGyroscopeMagnitudeMean
* timeBodyGyroscopeMagnitudeStandardDeviation
* timeBodyGyroscopeJerkMagnitudeMean
* timeBodyGyroscopeJerkMagnitudeStandardDeviation
* frequencyBodyAccelerationMeanX
* frequencyBodyAccelerationMeanY
* frequencyBodyAccelerationMeanZ
* frequencyBodyAccelerationStandardDeviationX
* frequencyBodyAccelerationStandardDeviationY
* frequencyBodyAccelerationStandardDeviationZ
* frequencyBodyAccelerationJerkMeanX
* frequencyBodyAccelerationJerkMeanY
* frequencyBodyAccelerationJerkMeanZ
* frequencyBodyAccelerationJerkStandardDeviationX
* frequencyBodyAccelerationJerkStandardDeviationY
* frequencyBodyAccelerationJerkStandardDeviationZ
* frequencyBodyGyroscopeMeanX
* frequencyBodyGyroscopeMeanY
* frequencyBodyGyroscopeMeanZ
* frequencyBodyGyroscopeStandardDeviationX
* frequencyBodyGyroscopeStandardDeviationY
* frequencyBodyGyroscopeStandardDeviationZ
* frequencyBodyAccelerationMagnitudeMean
* frequencyBodyAccelerationMagnitudeStandardDeviation
* frequencyBodyAccelerationJerkMagnitudeMean
* frequencyBodyAccelerationJerkMagnitudeStandardDeviation
* frequencyBodyGyroscopeMagnitudeMean
* frequencyBodyGyroscopeMagnitudeStandardDeviation
* frequencyBodyGyroscopeJerkMagnitudeMean
* frequencyBodyGyroscopeJerkMagnitudeStandardDeviation
 

## Raw data

The raw data set is available and described (how raw data were collected) at the following links

full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## Transformation
 
Quick description of each part of the script which collect and clean data:
* A  - Collect > download the raw dataset and put each data files into "rawdata_xxx" tables
* B1 - cliping raw datas into one dataset
* B2 - Extract only mean() and std() measurements
* B3 - Set descriptive activity names to name the activities in the data set
* B4 - Set descriptive variable names
* B5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject