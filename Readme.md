# Getting and Cleaning Data

## Course Project Instructions

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to work on this course project

1.  Download the source archive and unzip it into your working folder
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2.  Place run_analysis.R file in your working folder.

3.  Open run_analysis.R file in RStudio and step through it. You will see it creating
    variables and functions in the right hand window.
    
    ''Note:''  This file requires the packages reshape2 and data.table so if you see an error   
    while trying to load them thenyou may need to install them:
      
    install.packages("reshape2")
    install.packages("data.table")

4.  The two functions may take a few minutes depending on the speed of your machine because they 
    are labor entensive.

5.  Finally after the write statement you should have a tidy_data.txt file in your working folder

