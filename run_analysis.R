#Task 1: Merges the training and the test sets to create one data set.
setwd("~/UCI HAR Dataset")#locate the raw data package
#Load the Training dataset.
setwd("train")
train <- read.table("X_train.txt", header = FALSE, fill = TRUE)
#Give the training data matching subjects and activities (Row Labels)
trainlabels <- read.table("y_train.txt", header = FALSE, fill = TRUE)
names(trainlabels) <- c("activity")
trainsubs <- read.table("subject_train.txt", header = FALSE, fill = TRUE)
names(trainsubs) <- c("subject")
atrain <-  cbind(trainsubs, trainlabels, train)
#Do the same for the Test dataset.
setwd("../")
setwd("test")
test  <- read.table("X_test.txt", header = FALSE, fill = TRUE)
testlabels <- read.table("y_test.txt", header = FALSE, fill = TRUE)
names(testlabels) <- c("activity")
testsubs <- read.table("subject_test.txt", header = FALSE, fill = TRUE)
names(testsubs) <- c("subject")
atest <-  cbind(testsubs, testlabels, test)
#Finally, rowmerge the the traing and the test datasets.
setwd("../")
aboth <- rbind(atest, atrain)
#Task 1 completed

#Task 4: Appropriately labels the data set with descriptive variable names.
#Requires tidy data standards to be applied to the labels in features.txt.
setwd("~/UCI HAR Dataset")
var_names <- read.table("features.txt", header = FALSE)
#Replace hyphens with dots to avoid confusion with the minus sign.
var_names[,2] <- gsub("-", ".", var_names[,2])
#Remove all the brackets
var_names[,2] <- gsub("\\(|\\)", "", var_names[,2])
#Apply the tidy data names to the large dataframe from Task 1.
names(aboth) <- c("subject", "activity",as.character(var_names[,2]))

#Task 2: Extracts only the variables with "mean" and "standard deviation" in their names. 
meandf <- aboth[, (grepl("subject", names(aboth)) | grepl("activity", names(aboth)) | 
          grepl("[M,m]ean", names(aboth))| grepl("std", names(aboth)))]
#And straighten up the rows by subject and activity.
meandf <- meandf[order(meandf$subject, meandf$activity),]
#Task 2 completed

#Task 3: Uses descriptive activity names to name the activities in the data set
#Replace the numeric activity indices in the raw data with nominal factors from the activity labels file.
setwd("~/UCI HAR Dataset")
activity_labels <- read.table("activity_labels.txt", header = FALSE, fill = TRUE)
activity_list <- as.character(activity_labels$V2)#convert from numeric to character
meandf$activity <- as.factor(meandf$activity)#create 6 levels of a factor
levels(meandf$activity) <- c(activity_list)#names the levels
#Task 3 completed

#Task 5: Creates a second, independent tidy data set 
#        with the average of each variable for each activity 
#        and each subject. mean
#Alerts the existence of non-conforming data by stopping the run.
if(any(meandf[,3:88]>1|meandf[,3:88]< -1)) stop("Non-conforming data")
if(any(is.na(meandf[,3:88]))) stop("Data contains NA's")
#Calculates the mean of 86 variables (86 Colvars) for 30 subjects with 6 activities each (180 Rows)
#install.packages("plyr") #un-comment to download the package.
library(plyr)
dt2 <- ddply(meandf, c("subject", "activity"), .fun = numcolwise(mean))
#Completes Task 5.

#Finally, file the results for publication.
#Write the tidy data to a txt file.
setwd("~/GCDProject")
write.table(dt2, file = "cleandata.txt", sep = " ", col.names = TRUE)
#And file the column names for use in the Code Book.
dt3 <- names(dt2)
write.table(dt3, file = "codebook.txt", sep = "  ", col.names = TRUE, quote = FALSE)
