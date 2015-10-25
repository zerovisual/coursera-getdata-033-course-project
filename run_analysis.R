require("data.table")
require("reshape2")


#Loads and processes X_test & y_test data
#Extracts the standard deviation and measurements on the mean for each measurement
#returns the binded data
processXYTestData <- function(extract_features,activity_labels,features) {
  

  X_test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
  y_test_data <- read.table("./UCI HAR Dataset/test/y_test.txt")
  stest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  names(X_test_data) <- features
  
  X_test_data <- X_test_data[,extract_features]
  
  y_test_data[,2] <- activity_labels[y_test_data[,1]]
  names(y_test_data) <- c("ActivityID", "ActivityLabel")
  names(stest) <- "subject"
  
  data <- cbind(as.data.table(stest), y_test_data, X_test_data)
  data
}

#Loads and processes X_train & y_train data
#Extracts the standard deviation and measurements on the mean for each measurement
#returns the binded data
processXYTrainData <- function(extract_features,activity_labels,features) {

  X_train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
  y_train_data <- read.table("./UCI HAR Dataset/train/y_train.txt")
  
  strain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  names(X_train_data) = features
  
  # Extract only the measurements on the mean and standard deviation for each measurement.
  X_train_data <- X_train_data[,extract_features]
  
  # Load activity data
  y_train_data[,2] <- activity_labels[y_train_data[,1]]
  names(y_train_data) <- c("ActivityID", "ActivityLabel")
  names(strain) <- "subject"
  
  # Bind data
  bind <- cbind(as.data.table(strain), y_train_data, X_train_data)
  bind
}


activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
extract_features <- grepl("mean|std", features)

test_data <- processXYTestData(extract_features,activity_labels,features)
train_data <- processXYTrainData(extract_features,activity_labels,features)

# Merge test and train data from the functions
data <- rbind(test_data, train_data)

id_labels   <- c("subject", "ActivityID", "ActivityLabel")
data_labels <- setdiff(colnames(data), id_labels)
melt_data   <- melt(data, id = id_labels, measure.vars = data_labels)

tidy_data   <- dcast(melt_data, subject + ActivityLabel ~ variable, mean)

#write out new data set
write.table(tidy_data, file = "./tidy_data.txt",row.names=FALSE)
