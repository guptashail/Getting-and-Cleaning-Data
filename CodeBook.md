#Code Book

Steps followed in the script:

1. Read Features and Activity files first, and creates vectors of feature and activity names
2. Read the training data
3. Assign Feature names to Column names in training dataset

4. Read the activity list and subject list for training dataset
5. Do the factoring of activity and subject list
6. Join training data, activity list and subject list into a single dataset

7. repeat steps 4 to 6 for test dataset

8. Join the two datasets to make one dataset for all data

9. Subset the dataset to keep only Mean and Standard Deviation columns along with Activity and Subject columns

10. Calculate the average of Mean and Standard Deviation columns, grouped by Activity and Subject columns

11. Now we have a dataset containing mean of all observations for 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) for each of the 30 subjects

12. Rename the calculated columns by adding ".mean()" suffix to existing names to mention that these columns contain means of existing columns, e.g. the old column name "fBodyBodyGyroJerkMag-meanFreq()" will be now "fBodyBodyGyroJerkMag-meanFreq().mean()"

13. Export the dataset to text file, without row names
