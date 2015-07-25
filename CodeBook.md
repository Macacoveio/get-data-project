#Tidy data set generated with R script run_analysis.R and saved by the script as "tidy_data.txt"

##Original data set

The original data set used to obtain the tidy data can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The variables in the original data set are around 17 parameters estimated from 33 signals, resulting in more than 500 variables described in the features_info.txt file, that can be found in the folder with the original data set.

###Raw data set

The first step in run_analysis.R is to put together a raw data set, which is later summarized. The data for that purpose is scattered throughout several files in the original data. They are put together in one single table the following way:


* Column heads: "SubjectID"; "Activity"; features.txt
* First rows: test/subject_test.txt; test/y_test.txt; test/X_test.txt
* Last rows: train/subject_train.txt; train/y_train.txt; train/X_train.txt


The number labels in the "Activity" column were then replaced with the corresponding text labels from the activity_labels.txt file.


##Tidy data set

###Filtering of variables

As explained, the variables in the raw data were a set of about 17 parameters calculated for each of those 33 features. In order to form the tidy data set, only the mean and standard deviation were selected, resulting in a total of 66 variables.

###Summarizing the data

The tidy data set groups all observations of the 66 variables by subject and activity and, for each of the 180 (SubjectID X Activty) pairs, it calculates the mean, resulting in a table of 180 rows and 68 columns ("SubjectID", "Activity" and 66 variables).

The variables were renamed to start with either "Mean" or "Mean std of" followed by the variable name. Therefore, the variables in the tidy data set are, for example:
* Mean tBodyAcc()-X
* Mean tBodyAcc()-Y
* Mean std of tGravityAcc()-Z
* Mean std of tBodyGyroMag()
and so on.
