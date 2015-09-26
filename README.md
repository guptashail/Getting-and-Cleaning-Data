# Readme.md
##Coursera course Getting-and-Cleaning Data, course project

The script run_analysis.R assumes that all data is under one folder - "UCI HAR Dataset" (the name of the zip file that has all the data).

Call the function run_analysis() to run the script.

At the end of script, it will create a file "smartphones_data.txt" in your working directory.

This file has 81 columns - 79 columns for Mean of Mean columns and Mean of Standard deviation + 1 column for Activity data and 1 column for Subject data.

There are 6 activities for each of the 30 subjects (combined from Training and Test dataset).

The original column names have been renamed by adding a suffic ".mean()" to signify that these new columns are means of the same old column.

For the details on steps followed in script file, read CodeBood.md file.

The .R file also has detailed comments on each step written in the script file.
