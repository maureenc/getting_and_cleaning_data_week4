# Script to perform the analysis for the week 4 assignment of the Coursera course 
# Getting and Cleaning Data
#
# See README.md for a description of this script and the analysis steps
#
# See CodeBook.md for a description of the data and the variables


# load the necessary packages
library(dplyr)
library(data.table)

# set the working directory
setwd("/Users/maureen/DataScience/GettingandCleaningData/week4_assignment/UCI_HAR_Dataset")

# read the list of the variables contained in the main training and test data sets
features <- tbl_df(fread("./features.txt"))

# read the list of the activities and the shorthand codes assigned to them
activity_labels <- tbl_df(fread("./activity_labels.txt"))
colnames(activity_labels) <- c("activity_code","activity")

# read the training data set and assign descriptive columns names to all the variables
train_dat <- tbl_df(fread("./train/X_train.txt"))
colnames(train_dat) <- features$V2

# read the accompanying activies that match the measurements in the training data set;
# assign an appropriate column name
train_act <- tbl_df(fread("./train/y_train.txt"))
colnames(train_act) <- "activity_code"

# read the subjects that match the measurements in the training data set;
# assign an appropriate column name
train_sub <- tbl_df(fread("./train/subject_train.txt"))
colnames(train_sub) <- "subject"

# merge the 3 tables to create a single training data set
train <- tbl_df(cbind(train_sub,train_act,train_dat))

# read the test data set and assign descriptive columns names to all the variables
test_dat <- tbl_df(fread("./test/X_test.txt"))
colnames(test_dat) <- features$V2

# read the accompanying activies that match the measurements in the test data set;
# assign an appropriate column name
test_act <- tbl_df(fread("./test/y_test.txt"))
colnames(test_act) <- "activity_code"

# read the subjects that match the measurements in the test data set;
# assign an appropriate column name
test_sub <- tbl_df(fread("./test/subject_test.txt"))
colnames(test_sub) <- "subject"

# merge the 3 tables to create a single test data set
test <- tbl_df(cbind(test_sub,test_act,test_dat))

# merge the training and test data sets into a single data set
l=list(train,test)
alldata <- tbl_df(rbindlist(l,use.names=FALSE,fill=FALSE))

# extract the measurements on the mean and standard deviation for each measurement;
# keep the columns for the subject and activity identifiers as well
colselect1 <- grep("-mean\\(\\)",colnames(alldata))
colselect2 <- grep("-std\\(\\)",colnames(alldata))
colselect3 <- grep("subject",colnames(alldata))
colselect4 <- grep("activity_code",colnames(alldata))
cols <- c(colselect1,colselect2,colselect3,colselect4)
cols_sort <- sort(cols)
meanstd_data <- alldata[,cols_sort]

# assign descriptive activity names to the activities 
meanstd_data <- left_join(meanstd_data,activity_labels)

# group the data set by subject and activity
meanstd_data_group <- group_by(meanstd_data,subject,activity_code)

# create a new data set that contains the average of each variable for each 
# activity and each subject; the descriptive activity name is first removed but then
# added back in
sumdata1 <- summarise_each(meanstd_data_group,funs(mean),-activity)
sumdata <- left_join(sumdata1,activity_labels)

# write out the data to a .csv file
write.csv(sumdata,"sumdata.csv",row.names=FALSE)
