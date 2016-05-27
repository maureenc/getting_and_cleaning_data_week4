# getting_and_cleaning_data_week4---Codebook
Codebook for the Week 4 assignment of the Coursera course "Getting and Cleaning Data"

This file describes the data and the variables that are analyzed in the week 4 programming assignment of "Getting and Cleaning Data", as well as the contents of the file that is created by the analysis script "run_analysis.R". A description of how the data were transformed by "run_analysis.R" is given in the "README.md" file, included in this repository.

The original data sets and their description are provided on the course website. For completeness, we provide the link to the original website describing the data here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data files themselves can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .
The data files provided contain measurements obtained by motion sensors attached to a group of 30 subjects performing 6 different activities. A description of the measurements can be found in the file "features_info.txt", included in the zip-file. The zip-file unpacks into a directory "UCI_HAR_Dataset".

The analysis script "run_analysis.R" analyzes these data sets and creates a new file called "sumdata.txt". This file contains the average of a subset of the measured variables, grouped by subject and activity. What follows is a description of the variables names in "sumdata.txt".
- col 1 = subject: a numeric identifier for the person performing activites; whether a person belongs to the training or test group can be found in the files "./test/subject_test.txt" and "./train/subject_train.txt"
- col 2 = activity_code: a numeric code for the specific activity that was performed during the measurement
- col 3-68 = the average of the measurement as described by the column name, for a specific combination of subject and activity; a description of the variable that is measured can be found in the file "features_info.txt"
- col 69 = activity: a descriptive label for the activity



