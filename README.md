#Getting and Cleaning Data Course Project - run_analysis.R
#Version 1.0

##Fernando S Silva

This R script is part of the requirements for completion of the Coursera course "Getting and Cleaning Data", from Johns Hopkins University. The function contained in the R script run_analysis.R takes experimental data from acelerometers from Samsung Galaxy S smartphone obtained by Anguita et al (reference below) and turns it into a tidy data set as described in the file CodeBook.md

The raw data set to be used by run_analysis can be found in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Requirements

In order to properly run the function "run_analysis()" in R, observe the following conditions:

* You must have the reshape2 and plyr packages installed. If you don't, run install.packages("nameOfPackage") in R or RStudio
* The raw data set must be saved in your working directory in either of these formats:
	* a zipped file named "getdata-projectfiles-UCI HAR Dataset.zip"
	* a folder named "UCI HAR Dataset"
	* folders "train" and "test" and files "features.txt" and "activity_labels.txt" saved directly in the root of your working directory

##Output

The function run_analysis() will save a file named "tidy_data.txt" in the same directory where the raw data is (normally the "UCI HAR Dataset" folder). Beware: if you already have a file with that name, it will be overwritten.

The output data set is a table with 68 columns and 180 rows. Column names are at the first line.

##Reference

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
