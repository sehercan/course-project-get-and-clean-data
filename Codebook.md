---
title: "Course Project - Getting and Cleaning Data - Code Book"
author: "Seher Can Akay"
date: "8/9/2019"
output: html_document
---

This Code book describes the variables, the data and the work that I have performed to clean up the data for Course Project, Getting And Cleaning Data.

## Data

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation


The result file includes the average for these variables based on each activity and each subject.

The original data can be found on: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


### Units
* The variables formatted as %BodyAcc% and %Gravity% are on standard gravity unit "g".
* The variables formatted as %BodyGyro% are on radians/second.

## run_analysis.R

run_analysis.R is the R script file that I have created to implement the requirements of the project.

It includes 6 steps in it.

Step 1: It reads the test and train data on related files and create one big data to work on.

Step 2: The merged data includes 563 columns which columns mostly will not be used for this project. So, the required data has been extracted to get only mean and standard deviation for each measurement.

Step 3: Activities are kept on ID bases. Within this step, they are all mapped to related values.

Step 4: Column names of the data includes parantheses "()". I have removed them to keep
the variable names tidy.

Step 5: The data has been melted for casting. Then I have casted the data to calculate the average each activity and each subject.

Step 6: I have created a .txt file which includes the results of the script. The produced .txt file can be uploaded to Coursera.

