Tidy Data Assignment README.me (remember to use proper headers)
###################
Assignment Description from the website:

You should create one R script called run_analysis.R that does the following. 
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
####################

#Run_Analysis for Getting and Cleaning Data Project
This is a markdown file with the variables, the data, and  transformations performed to clean up the data

##The Different Data Variables Formed When Running the run_analysis.R script
###All data is numeric except the activity column/act data set which is a factor
*testact - activity codes corresponding to test set
*testset - test set of data with subjects and activities added
*testsub - subject numbers corresponding to test data 
*trainact - activity codes for training set of data
*trainset - training set of data with subjects and activities added
*transub - subject numbers corresponding to training data 
*allset - combined training and test sets of data sorted by subject
*tidydata - tidy set of data organized by activity type. all data
*tidy2 - tidy set of data organized by activity type. means (included freq), and std
*tidy2bysubject - tidy set of data organized by subject. means (included freq), and std
*feat - all features from the feature.txt file with activity and subject added

##Transformations of the data
*read in train/test data set, subjects, and activity codes
*set new levels with names for the activity codes in the test/train act
*combine test set data, testact, testsub to form the testset variable
*combine train set data, trainact, trainsub to form the trainset variable
*combine testset and trainset data of data to form allset
*add subject, activity, and features names for column names
*Select for only those columnes with "mean" or "std" in the name to get tidydata
*Aggregate function to take the mean of data by "subject" and "activity", remove two old column and then add back just the column names, to form tidy2
*sort by subject number to form tidy2bysubject
*write tables as txt files that are tab deliminated.

