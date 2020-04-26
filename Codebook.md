---
title: "CodeBook for Coursera Week 4 project"
author: "Joseph Fowler"
date: "April 26, 2020"
output: html_document
---

##Code Book
This code book will describe the data used in this project, as well as the processing required to create the resulting tidy data set.

###Overview
>The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
The data is Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying the aforementioned waist-mounted smartphone with embedded inertial sensors.

###Data Source
The data can be found here: 

>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Data Explanation
The background can be found here:

>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

For each record in the dataset, the following information is provided

1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

2. Triaxial Angular velocity from the gyroscope.

3. A 561-feature vector with time and frequency domain variables.

4. Its activity label.

5. An identifier of the subject who carried out the experiment.

###Explanation of each file
1. features.txt: Factor w/ 477 levels

2. activity_labels.txt: Factor w/ 6 levels
3. X_train.txt: 'data.frame':	7352 obs. of  79 variables Note - this contains only the test subjects (21 of 30)

4. subject_train.txt: 'data.frame':	7352 obs. of  1 variable (note, this is the ID of the volunteer) from X_train.txt.

5. y_train.txt: 'data.frame':	7352 obs. of  2 variables (note, this is the ID of the activity related to each of the observations in X_train.txt.

6. X_test.txt: 'data.frame':	2947 obs. of  79 variables (note, this is for 9 of the 30 volunteers).

7. subject_test.txt:'data.frame':	2947 obs. of  1 variable: (note, this is the ID of the volunteer related to each of the observations in X_test.txt.

8. y_test.txt: 'data.frame':	2947 obs. of  2 variables:A vector of 2947 integers (note, this is the ID of the activity related to each of the observations in X_test.txt.

###Additional info

More information about the files can be found in the README.txt of the data set, and additional information about the features is available in features_info.txt in the same area. 

###Data files that were not used
Any data files in the "Inertial Signals" folders were not used in this project. 

###Processing steps
1. Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip to any directory (note, useful to unzip directly to your R working directory)

3. Ensure the data is in the R working directory

4. Read all the relevant data files into data frames, add appropriate column headers.

5. Merge the training and test data set

5. All feature columns were removed that did not contain the exact string "mean()" or "std()". This left 66 feature columns

6. A tidy data set was created containing the mean of each feature for each subject and each activit

7. The tidy data set was written to a TXT file
