Variables

train1, train2, train3 are the rawdata imported from x_train.txt, y_train.txt, subject_train.txt files

test1, test2, test3 are the rawdata imported from x_test.txt, y_test.txt, subject_text.txt files

train_data is the dataset comibined with all 3 training data sets using cbind function

test_data is the dataset combined with all 3 test data sets using cbind function

sensor_data is the dataset combined with train_data and test_data using rbind function

features is the dataset imported from features table that consists of feature names to be used as column names.
for sensor_data_clean column 1:561

activities is the dataset imported from actvitity_table and is reshaped to be have proper column names (ActivityId and Activity).  
ActivityId is used for sensor_data_column 563

sensor_labels are combined to be used as column names for sensor_labels

sensor_data_clean is the clean dataset with the value of measuremeant of mean, standard deviation extracted, column name reformated
and columns are labeled using the descriptive variable names

sensor_avg_by_act_by_sub is the dataset created that consists of average of each variable for each activity and each subject. ddply() 
function from plyr pacakge is used to apply column wise mean. 
 
Finally, the sensor_avg_by_act_by_sub is write into tidy.txt file using write.table function. 
