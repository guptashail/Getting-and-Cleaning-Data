run_analysis <- function(){
  
  #function to read, clean and summarize the Human Activity Recognition Using Smartphones Data Set
  #from UCI Machine Learning Repository for "Getting and Cleaning Data" course

  #read the acivity labels file
  labelsSet <- read.table("UCI HAR Dataset/activity_labels.txt", sep="")
  
  #get the list of activity labels
  activityNames = as.character(labelsSet$V2)

  #read the features list files
  featuresSet <- read.table("UCI HAR Dataset/features.txt", sep="")
  #get the list of features
  attributeNames <- featuresSet$V2

  #read the training data
  trainSetX <- read.table("UCI HAR Dataset/train/x_train.txt", sep = "")
  
  #set the names (attributes as in data table) of the training set to features
  names(trainSetX) = attributeNames
  
  #read the list of activities for trainig set
  trainSetY = read.table("UCI HAR Dataset/train/y_train.txt", sep = "")
  
  #name the column to Activity
  names(trainSetY) = "Activity"
  
  #convert to factors
  trainSetY$Activity = as.factor(trainSetY$Activity)

  #set the activity names
  levels(trainSetY$Activity) = activityNames
  
  #read the list of training subjects
  trainSubjects = read.table("UCI HAR Dataset/train/subject_train.txt", sep = "")
  
  #name the column to subject
  names(trainSubjects) = "subject"
  
  #convert to factors
  trainSubjects$subject = as.factor(trainSubjects$subject)
  
  #add the activity and subject columns to training dataset
  train = cbind(trainSetX, trainSubjects, trainSetY)

  #read the test dataset
  testSetX <- read.table("UCI HAR Dataset/test/x_test.txt", sep = "")
  
  #set the column names of test dataset to features measured
  names(testSetX) = attributeNames
  
  #read the list of test activities
  testSetY = read.table("UCI HAR Dataset/test/y_test.txt", sep = "")
  
  #rename the column to Activity
  names(testSetY) = "Activity"
  
  #convert to factors
  testSetY$Activity = as.factor(testSetY$Activity)

  #set the activity names
  levels(testSetY$Activity) = activityNames

  #read the list of subjects
  testSubjects = read.table("UCI HAR Dataset/test/subject_test.txt", sep = "")
  
  #name the column to subject
  names(testSubjects) = "subject"

  #convert to factors
  testSubjects$subject = as.factor(testSubjects$subject)

  #add activity and subject columns to test dataset
  test = cbind(testSetX, testSubjects, testSetY)

  #join the test and training datasets
  totalData <- rbind(train,test)

  #get the column names of dataset
  msColNames <- names(totalData)

  #filter the dataset to get only those columns that have mean or standard deviation measurements
  #also keep subject and Activity columns
  msData <- totalData[,c(msColNames[grepl("mean|std", names(totalData))], "subject","Activity")]

  #convert to a table dataset
  msData.dt <- data.table(msData)

  #calculate the average of each column by Activity and subject
  msDataMean <- msData.dt[,lapply(.SD, mean), by = c("Activity", "subject"), .SDcols=1:79]

  #we would to change the name of columns to mention that they are mean of old columns
  #get the names of existing columns
  oldNames <- names(msDataMean)

  #filter the names to remove Activity and subject, and keep only measurement columns
  oldNames <- oldNames[grepl("mean|std", names(msDataMean))]

  #change the names of existing columns and add .mean to their names to reflect that they are mean of old columns
  setnames(msDataMean,oldNames,paste(oldNames,".mean()",sep=""))

  #write the data to a txt file with no row numbers (row names)
  write.table(msDataMean, "smartphones_data.txt", row.name=FALSE )

}