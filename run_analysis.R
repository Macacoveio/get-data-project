run_analysis<-function()
      message("Searching for data set in the working directory")
      filesFound<-logical()
      filesFound<-FALSE
      wd<-getwd()
      if(file.exists("./UCI HAR Dataset")) {
            setwd("UCI HAR Dataset")
            filesFound<-TRUE
      }
      if(!filesFound & file.exists("./train","./test","features.txt"
                                   "activity_labels.txt")) {
            filesFound<-TRUE
      }
      if(!filesFound & file.exists("getdata-projectfiles-UCI HAR Dataset.zip")){
            message("Extracting compressed data to ",wd)
            unzip("getdata-projectfiles-UCI HAR Dataset.zip")
            setwd("UCI HAR Dataset")
            filesFound<-TRUE
      }
      if(!filesFound) {
            setwd(wd)
            message("Data not found in ",wd)
            stop("Dataset must be saved to your current working directory.")
      }
      message("Loading necessary packages.")
      library(reshape2)
      library(dplyr) ## This is necessary to create tidy data set

      message("Reading data from text files")
      feature_names<-read.table("features.txt")
      activity_labels<-read.table("activity_labels.txt")
      subjID_test<-read.table("./test/subject_test.txt")
      subjID_train<-read.table("./train/subject_train.txt")
      test_data<-read.table("./test/X_test.txt")
      train_data<-read.table("./train/X_train.txt")
      test_labels<-read.table("./test/y_test.txt")
      train_labels<-read.table("./train/y_train.txt")

      message("Merging data into a single data set")
      ## First, get all the experimental data and put in one single table
      raw_data<-rbind(test_data,train_data)
      ## Now, use the names of the features as column names
      colnames(raw_data)<-feature_names[,2]
      ## Next, add two columns to the left of the data set. Subject ID and
      ## labels. Both are to be considered as factor variables.
      labels<-rbind(test_labels,train_labels)
      subjects<-rbind(subjID_test,subjID_train)
      subjects[,1]<-as.factor(subjects[,1])
      labels_text<-sapply(labels, function(x) x<-activity_labels[x,2])
      labels_factor<-factor(labels_text,levels=activity_labels[,2])
      raw_data<-cbind(labels_factor,raw_data)
      raw_data<-cbind(subjects,raw_data)
      colnames(raw_data)[1:2]<-c("SubjectID","Activity")
      ## Now that we have the data set, let's clean the auxiliary variables.
      ## The goal is not to overload the computer's memory.
      rm(feature_names,activity_labels,subjID_test,subjID_train,test_data,
         train_data,test_labels,train_labels,labels,subjects,labels_text,
         labels_factor)

      message("Extracting means and standard deviations for each measurement")
      ## Considering only the features whose name has "mean()" or "std()" on
      ## them. Frequency means are excluded. Variables for individual axes
      ## are included.
      colsMean<-grep("-mean()",colnames(raw_data))
      colsSD<-grep("std()",colnames(raw_data))
      raw_data<-raw_data[,c(1,2,colsMean,colsSD)]
      colsFreq<-grep("meanFreq",colnames(raw_data))
      raw_data<-raw_data[,-colsFreq]
      
      message("Creating tidy data set.")
      tidy_data<-raw_data %>%
            arrange(SubjectID,Activity) %>%
            melt(id.vars=c("SubjectID","Activity")) %>%
            dcast(SubjectID+Activity ~ variable,mean)
      ## Adjusting variable names to a more explanatory one. Basically, taking
      ## the terms "Mean" and "Mean std of" and bringing them to the beginning
      ## of the variable's name.
      names<-colnames(tidy_data)
      meanVars<-grep("mean()",names)
      names<-gsub("-mean()",replacement="",names)
      names[meanVars]<-paste("Mean",names[meanVars])
      
      stdVars<-grep("std()",names)
      names<-gsub("-std()",replacement="",names)
      names[stdVars]<-paste("Mean std of",names[stdVars])

      colnames(tidy_data)<-names
      
      message("Saving tidy data set.")
      write.table(tidy_data,file="tidy_data.txt",row.names=FALSE)
      message("Saved file tidy_data.txt to the folder where UCI data is stored")
      ## Return to original working directory
      setwd(wd)