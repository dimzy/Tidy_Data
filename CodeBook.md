# CookBook

## Input Data

The script assumes that the UCI dataset is extracted unchanged into ./ with the existing folder structure intact. 
Furthe description of the input dataset can be found within the extracted ./train and ./test data folders

## Output Data

The resulting `./tidy_data.txt` dataset includes mean and standard deviation variables for the following original variables,

tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk, tBodyAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc, fBodyAccJerk, fBodyGyro, fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroMag, fBodyBodyGyroJerkMag. All three X, Y, Z directions are included.

The units and formats of the output data retains the same as the input. 

## Operations

`run_analysis.R` does the following:
1. Load the files in the train and test subfolders
2. Merge the train and test data together
3. Set the column header on the subject label columns
4. Compute the mean of the merged set, grouping by subject/activity
5. Save the computed mean and then writes the output to `./tidy_data.txt`
