## R project: Getting and Cleaning Data

# Downloading and unzipping data

if (!dir.exists("/Users/jkcollection/Learning/R-project_Getting-and-Cleaning-Data")) {
    dir.create("~/Learning/R-project_Getting-and-Cleaning-Data")
}

setwd("~/Learning/R-project_Getting-and-Cleaning-Data")

filename <- "R-project-data.zip"
if (!file.exists(filename)) {
    URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(URL, destfile = filename, method = "auto")
}

folder <- "UCI HAR Dataset"
if (!file.exists(folder)) {
    unzip(filename)
}

setwd("./UCI HAR Dataset/")

# Reading in data

features <- read.table("features.txt", col.names = c("n", "feature"))
activities <- read.table("activity_labels.txt", col.names = c("label", "activity"))
x_train <- read.table("./train/X_train.txt", col.names = features$feature)
y_train <- read.table("./train/y_train.txt", col.names = "label")
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
x_test <- read.table("./test/X_test.txt", col.names = features$feature)
y_test <- read.table("./test/y_test.txt", col.names = "label")
subject_test <- read.table("./test/subject_test.txt", col.names = "subject")

# 1. Merges the training and the test sets to create one data set

x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
data1 <- cbind(x, y, subject)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
 
data2 <- data1 %>% dplyr::select(subject, label, contains("mean"), contains("std"))

# 3. Uses descriptive activity names to name the activities in the data set

data2$label <- activities[data2$label, 2]

# 4. Appropriately labels the data set with descriptive variable names

names(data2)[2] = "activity"

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

data3 <- data2 %>%
    group_by(subject, activity) %>%
    summarise_all(list(mean))

# writing out the data set 

setwd("~/Learning/R-project_Getting-and-Cleaning-Data")
write.table(data3, "tidy_data.txt", row.names = FALSE)
