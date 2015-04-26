url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
setInternet2(use = TRUE)

# Download the zip file and unzip the compressed file into the directory

download.file(url, destfile = "C:/Users/Harish/Downloads/Data Science/Getting&Cleaning Data/tidydata.zip",mode ="wb")
unzip("C:/Users/Harish/Downloads/Data Science/Getting&Cleaning Data/tidydata.zip")

# Read the unzipped files into R (Training data)

x_train<-read.table("C:/Users/Harish/Desktop/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("C:/Users/Harish/Desktop/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("C:/Users/Harish/Desktop/UCI HAR Dataset/train/subject_train.txt")

# Read the unzipped files into R (Test data)

x_test<-read.table("C:/Users/Harish/Desktop/UCI HAR Dataset/test/X_test.txt") 
y_test<-read.table("C:/Users/Harish/Desktop/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("C:/Users/Harish/Desktop/UCI HAR Dataset/test/subject_test.txt")

# Step 1 
##########

# Merge the training and test sets to create one data set

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Step 2
##########

# Extract only the measurements on the mean and standard deviation for each measurement


features <- read.table("C:/Users/Harish/Desktop/UCI HAR Dataset/features.txt")
mean_and_std_features <- grep("-(mean|std)\\(\\)",features[, 2])
x_data <- x_data[, mean_and_std_features]

# Step 3
##########

#Uses descriptive activity names to name the activities in the data set

names(x_data) <- features[mean_and_std_features, 2]

activities <- read.table("C:/Users/Harish/Desktop/UCI HAR Dataset/activity_labels.txt")
y_data[, 1] <- activities[y_data[, 1], 2]

# Step 4
##########

# Appropriately label the data set with descriptive variable names

names(y_data) <- "activity"
names(subject_data) <- "subject"

# Bind all the data in a single dataset

full_data <- cbind(x_data, y_data, subject_data)

# Step 5
##########

# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

library(plyr)
means_data <- ddply(all_data,.(subject, activity),function(x) colMeans(x[,1:66]))
write.table(means_data,"C:/Users/Harish/Downloads/Data Science/Getting&Cleaning Data/means_data.txt",row.names=FALSE)




