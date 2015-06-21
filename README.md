# Tidy_Data
R_clean data project. Project intends to present a set of tidy data from the UCI Samusung Smartphone data set here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Components
Project folder contains the following files: 
- Readme.md -> Project overview and walkthrough
- run_analysis.R -> R script for generating the data set
- CookBook.md -> Markup file describing the data in the output set. 

## Starting the project
To generate the clean dataset, the following conditions must be met:
* Data is downloaded and extracted
* The run_analysis.R script is in the root folder of the Data folder
* the reshape2 R package is installed. (e.g. install.pacakges(reshape2)

Run the rscript in the described directory will generate the tidy dataset at that directory. 
