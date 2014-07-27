
##R Script that does the following##
#see markdownfile and readme for more information on the original files and the transformations.

#Create new directory for the data, download data, unzip data, and load data into two files

#Read in the test and training data sets at numeric tables
testset <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = "numeric")
trainset <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = "numeric")
testsub <- read.table("./UCI HAR Dataset/test/subject_test.txt", colClasses = "numeric")
trainsub <- read.table("./UCI HAR Dataset/train/subject_train.txt", colClasses = "numeric")
#Read in activity codes for each measure and convert from number to character
testact <- read.table("./UCI HAR Dataset/test/Y_test.txt", colClasses = "factor")
trainact <- read.table("./UCI HAR Dataset/train/Y_train.txt", colClasses = "factor")
levels(testact$V1) <-  c("WALKING",  "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
levels(trainact$V1) <-  c("WALKING",  "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

#Combine subject and activity data with the measurements with test and train sets
testset <- cbind(testsub, testact, testset)
trainset <- cbind(trainsub, trainact, trainset)
#Combine and order the entire data set
allset <- rbind(trainset, testset)
allset <- allset[order(allset$V1),]

#Read in features for use as column names
feat <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
feat <- feat[,2] #make a vector
feat <- c("subject", "activity", feat) #add names for columns added to beginning of variable
colnames(allset) <- feat #add column names to large data set

#subset data by column names including mean or std out the columns to
tidydata <- allset[,c(1, 2, grep("mean()", names(allset)), grep("std()", names(allset)))]

tidy2 <- aggregate(tidydata, list(tidydata$subject, tidydata$activity), mean) #take the mean of all data by subject and activity
tidy2 <- tidy2[, -(3:4)] #remove extra columns. Is there a way to do aggregate with doing this? 
colnames(tidy2)[1:2] <- c("subject", "activity") #add back column names
tidy2bysubject <- tidy2[order(tidy2$subject),] #data sorted by subject number rather than activity

#write both files as txt files with tab seperation.  
write.table(tidy2, "./tidy2.txt", sep="\t") 
write.table(tidy2bysubject, "tidy2bysubject.txt", sep = "\t")
