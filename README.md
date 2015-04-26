# Coursera-Getting-and-Cleaning-Data-Course-Project

This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.
The code takes for granted all the data is present in the same folder, un-compressed and without names altered.
CodeBook.md describes the variables, the data, and any transformations or work that was performed to clean up the data.
run_analysis.R contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file.
The output of the 5th step is called means_data.txt which is uploaded in the course project's form.

## Introduction

* The script run_analysis.R performs the 5 steps described in the course project's definition.
* All the similar data(matching dimensions) is merged using the rbind() function. 
* Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. For this we are using the grep function on features.txt so that we get the indices and with that indices we extract the data from X_train/X_test datasets. After extracting these columns, they are given the correct names, taken from features.txt.
* As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
* On the whole dataset, those columns with vague column names are corrected.
* Generate a new dataset with all the mean measures for each subject and activity type. The output file is called means_data.txt, and uploaded to this repository.
