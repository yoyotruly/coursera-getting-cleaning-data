---
title: "Coursera Getting and Cleaning Data - Final Project"
---

This document is to explain the R script (run_analysis.R) for the final project of Coursera's Getting and Cleaning Data course. The objective of this project is to collect, work with, and clean the [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) data set from the UCI Machine Learning Repository. The R script performs the following tasks:

1. Import and combine the X variables, Y variable and subject number for the train and test datasets
2. Merge the train and test sets
3. Label variables V1 through V561 with descriptive names
3. Extract only the measurements on the mean and standard deviation for each measurement
4. Label the activities with descriptive names, e.g. laying, walking, etc.
6. Creates an independent tidy data set with the average of each variable for each activity and each subject
7. Export the tidied data set as average.txt

The cleaned data set, average.txt, can also be found in this repo.