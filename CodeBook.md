# Data
- The data used for this project was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of the experiment can be found in the downloaded material [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) `README.txt` file.

- The main data for this project is provided in six separate data sets: `X_train.txt`, `y_train.txt`, `subject_train.txt`, `X_test.txt`, `y_test.txt` and `subject_test.txt`.

- `X_train.txt` and `X_test.txt` variables' names can be found in `features.txt` file. Further information about the variables is in the `features_info.txt` file.

- Each number in the `y_train.txt` and `y_test.txt` corresponds to activity name in `activity_labels.txt`

- Each row in the `subject_train.txt` and `subject_test.txt` identifies the subject (from 1 to 30) who performed the activity.

# Work
- The `run_analysis.R` script performs downloading, unzipping, reading in data and then does the following 5 steps:

 1. Merges the training and the test sets to create one data set. (Hereafter `X_train.txt` and `X_test.txt` refers to `x`, `y_train.txt` and `y_test.txt` - to `y`, `subject_train.txt` and `subject_test.txt` - to `subject`.) The `x`, `y` and `subject` are binded by row separately and then all three of them are binded by column.
 
 2. Extracts only the measurements on the mean and standard deviation for each measurement. For the column of `x`, only those measurements are extracted, which have mean or std in their names.
 
 3. Uses descriptive activity names to name the activities in the data set. 
