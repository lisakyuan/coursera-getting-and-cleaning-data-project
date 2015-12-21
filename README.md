# coursera-getting-and-cleaning-data-project
Class project

This is course project for the Coursera Getting and Cleaning Data course.  The R script run_analysis.R does the following: 

1. load the raw data into R
2. load features and activities file
3. combine 3 sets of training and test dataset to one training dataset and one test dataset
4. combine train data and test data into one data set: sensor_data
5. create the labels for sensor_data
6. extract the mean and standard deviation of the sensor_date to create a clean data set: sensor_data_clean
7. use discriptive names to name activities in the sensor_data_clean dataset by merging sensor_data_clean and activity datasets
8. clean sensor_data_clean labels
9. create tidy data set that consists average value of each variable for each activity and each subject
10. write new data set into a text file 

The end result in shown in the file tidy.txt
