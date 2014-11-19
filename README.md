getting-cleaning-data-assignment
================================

Programming assignment for Getting and Cleaning Data class (Coursera).

The script is meant to be run on the data avaliable at (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

It merges all data from train and test sets, puts the names of the features in each columns and the names of the activities in each line. Then, the script cleans all the data, leaving only the means and standard deviations, and finally it calculates the mean and stardard deviation for all the values, sorted by subject and activity.

This repository contains 4 files:

- README.md : this file.
- run_analysis.R : a script to run all the cleaning and sorting of data, as well as calculating means and standard deviation, as required for the assignment.
- features_clean.txt : a edited version of the 'features.txt' of the original data set used. This file is used as a index for the columns of interest, i.e. the means and standard deviation of the features.
