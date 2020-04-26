## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Firstly, the script checks that the required packages are installed
## If the packages are not available, the script will install them

if (!require("data.table")) {
            install.packages("data.table")
}

if (!require("reshape2")) {
            install.packages("reshape2")
}

require("data.table")
require("reshape2")

## Ensure working directory is set appropriately
## Note, it is assumed the data set is already downloaded and present
## This script does not include any step to download the data set (was not required)

setwd("H:/Joe/Data Science/Week 4 Project")


# The script now reads in the activity labels
activity_labels <-
            read.table("./UCI HAR Dataset/activity_labels.txt")[, 2]

# The script now reads in the column names
features <- read.table("./UCI HAR Dataset/features.txt")[, 2]

# As per the requirements, were only need the mean and standard deviation results
# for each measurement.
extract_features <- grepl("mean|std", features)


# The script now performs an initial read and processing of the test data.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <-
            read.table("./UCI HAR Dataset/test/subject_test.txt")

names(X_test) = features

# As per the requirements, were only need the mean and standard deviation results
# for each measurement.
X_test = X_test[, extract_features]

# Load activity labels
y_test[, 2] = activity_labels[y_test[, 1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# The script now performs an initial read and processing of the training data.
# This should be a repeat of the earlier code for the test data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

subject_train <-
            read.table("./UCI HAR Dataset/train/subject_train.txt")

names(X_train) = features

# As per the requirements, were only need the mean and standard deviation results
# for each measurement.
X_train = X_train[, extract_features]

# Load activity data
y_train[, 2] = activity_labels[y_train[, 1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# At this stage, we have read the testing and training data set
# As per the requirements, we now need to merge the data set
data = rbind(test_data, train_data)

# Ensure the data set is labelled with appropriately descriptive names
# Again, as per the requirement

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

# Finally, we can write our new tidy data set
# The file is output into the working directory set

write.table(tidy_data, row.name=FALSE, file = "./tidy_data.txt")
