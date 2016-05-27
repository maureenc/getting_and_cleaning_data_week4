# getting_and_cleaning_data_week4
Week 4 assignment of the Coursera course "Getting and Cleaning Data"

This repo contains the analysis script "run_analysis.R" that performs the required steps for the week 4 programming assignment of the course "Getting and Cleaning Data". The data set to be analyzed is provided on the course web site, and is described in detail in CodeBook.md. What follows is a description of the analysis steps.

1. After setting the working directory to the correct location, the script reads in a file that contains the variable names in the main data sets, and a file that contains a descriptive name for the activities (which are coded in the main data sets).

2. Then the script reads in the files that make up the training and test data sets, and assigns appropriate column names. Three separate files are provided for both the training and test data set: these contain the measurements, the activities that match these measurements, and the identifiers of the subjects who performed the activities. The script merges these three files to create a master training data set and a master test data set, named "train" and "test", respectively. 

3. As requested in part 1 of the assignment, the script merges "train" and "test" into a master data set named "alldata". 

4. As requested in part 2 of the assignment, the script then extracts the measurements on the mean and standard deviation for each measurement. To facilitate further analysis, the columns for the subject and activity identifiers are kept as well. The resulting data frame is called "meanstd_data".

5. As requested in part 3 of the assignment, the script then assigns descriptive names to each of the activities in "meanstd_data" by adding a column "activity".

6. The script cleans up the column names, which takes care of part 4 of the assignment (i.e. assigning descriptive names to the variables). 

7. Finally, "meanstd_data" is grouped by subject and activity, and saved in a new data frame called "meanstd_data_group". The average is computed for all the measured variables in "meanstd_data_group", for each subject/activity group separately. The result is saved in the data frame "sumdata", and written to a file called "sumdata.txt". This completes part 5 of the assignment.
