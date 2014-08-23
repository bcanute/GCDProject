This project involved the production of a clean dataset, derived from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Please note that the new data file has had to be forwarded to you as cleandata.txt and you should rename it with the .csv extension.

My instructions were as follows:

You should create one R script called run_analysis.R that does the following. 

 1.   Merge the training and the test sets to create one data set.
 2.   Extract only the measurements on the mean and standard deviation for each measurement. 
 3.   Use descriptive activity names to name the activities in the data set
 4.   Appropriately labels the data set with descriptive variable names. 
 5.   Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
 
 These tasks were achieved by way of the creation of run_analysis.R which is located in this directory.
 
 The resultant new data file, cleandata.csv, is also included in this directory.
 
 A code book explaining the contents of the newly derived data file is also included.
 
 Rationale for Completing the Project.
 
 As one can easily detect, the instructions for this project were at best cryptic.  Nor was the originator of the project available for consultation.
 
 I have therefore taken the instructions literally and I must confess to only the most limited understanding of the statistical content of either the old or the new file.
 
 Precisely stated, I took the following steps:
 
 	1. Renamed the dependent variables to conform with the normal standards for tidy data.
 	2. Removed any variables that did not include the words "mean" or "standard deviation" in their name.
 	3. Calculated the mean for each dependent variable within each subset of subject by activity (N = 180 (30 subjects by 30 activities).
 	4. Placed the resultant 180 by 88 element dataframe in a csv format, with column headings included.
 	
 Any further queries should be directed to the original authors:
 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

License for the Original Source Data:
===========================
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Limited Liability:  
This script was created as a student project with no intention that it would be run by a third party.  The script should not be run and no liability is accepted for any damage arising from this act.

