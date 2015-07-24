#Tidy data set generated with R script run_analysis.R and saved by the script as "tidy_data.txt"

##Group/index variables

All the data collected from the smartphone signals is attributed to a subject (SubjectID) and an activity label (Activity). So, the first two columns in the dataset are:
* SubjectID - a number from 1 to 30.
* Activity - one of the following labels: "WALKING" "WALKING_UPSTAIRS" "WALKING_DOWNSTAIRS" "SITTING" "STANDING" "LAYING"



##Feature Selection (explanation copied from the original data set)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The variables in the raw data were a set of about 17 parameters calculated for each of those 33 features. In order to form the tidy data set, only the mean and standard deviation were selected, resulting in a total of 66 variables.

The tidy data set groups all observations of the 66 variables by subject and activity and, for each of the 180 (SubjectID X Activty) pairs, it calculates the mean. Therefore, the variables in the tidy data set are, for example:
* Mean tBodyAcc()-X
* Mean tBodyAcc()-Y
* Mean std of tGravityAcc()-Z
* Mean std of tBodyGyroMag()
and so on.
