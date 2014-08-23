#README Human Activity Recognition Using Smartphones

##This repository contains:
* this README file, which describes the content of the repository :README.md
* a tidy data set : tidydataset2
* a codebook which describes the tidydataset : CodeBook.md
* a script which collect the raw data, merge, clean, and build the tidy data set: run_analysis.R


##Description of the script 

###Actions to be performed to get the tidy data set: 
Just launch run_analysis.R in R
(the downloading of the data set is performed in the first part of the script)

###Input:
The raw dataset, downloaded by the script (partA)
###Output: 
The tidy data set with mean of each measurements (mean and std) per activity and subject.
This output is available in R (tidydataset2) and in a text file "tidydataset2.txt" in R working directory

###Quick description of each part of the script:
* A  - Collect > download the raw dataset and put each data files into "rawdata_xxx" tables
* B1 - cliping  raw datas into one dataset
* B2 - Extract only mean() and std() measurements
* B3 - Set descriptive activity names to name the activities in the data set
* B4 - Set descriptive variable names
* B5 - Creates a second, independent tidy data set with the average of each variable
       for each activity and each subject

	 