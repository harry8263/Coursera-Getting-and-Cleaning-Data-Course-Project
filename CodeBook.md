## Means_data.txt

* Subject   1
  Random sample from group of 30 volunteers within an age bracket of 19-48 years.
* Activity
  6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
* ~mean()
  Means of all the features that was measured for an activity and a subject combination.
* ~std()
  Standard Deviations of all the features that was measured for an activity and a subject combination.

## Variables

* x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
* x_data, y_data and subject_data merge the previous datasets to further analysis.
* Features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features.
* Same approach is taken with activity names through the activities variable.
* all_data merges x_data, y_data and subject_data in one single dataset.
* means_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.
