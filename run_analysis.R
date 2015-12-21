library(plyr)


#load raw data into the working environment
library(data.table)
train1<- read.table("X_train.txt")
train2<- read.table("y_train.txt")
train3<- read.table("subject_train.txt")
setwd("../")
setwd("./test")
test1 <- read.table("X_test.txt")
test2 <- read.table("y_test.txt")
test3 <- read.table("subject_test.txt")
setwd("../")

#loading features and activities
features <- read.table("features.txt", colClasses = c("character"))
activity <- read.table("activity_labels.txt", col.names = c("ActivityId", "Activity"))



#combine data for train and test
train_data <- cbind(cbind(train1, train3), train2)
test_data <- cbind(cbind(test1, test3),test2)

#combine train_data and test_data
sensor_data <- rbind(train_data, test_data)

#label the sensor_data
sensor_labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(sensor_data) <- sensor_labels

#extract only mean and standard deviation

sensor_data_clean <- sensor_data[, grep("mean|std|ActivityId|Subject", names(sensor_data))]

#name activities using discriptive names
sensor_data_clean <- join(sensor_data_clean, activity, by="ActivityId", match = "first")

#clean sensor_data_clean labels


names(sensor_data_clean) = gsub('-mean', 'Mean', names(sensor_data_clean))
names(sensor_data_clean) = gsub('-std', 'std', names(sensor_data))
names(sensor_data_clean) = gsub('[-()]', '', names(sensor_data_clean))

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
sensor_avg_by_act_by_sub <- ddply(sensor_data_clean, c("Activity", "Subject"), numcolwise(mean))

#Write new data set into a text file
write.table(sensor_avg_by_act_by_sub, "sensor_avg_by_act_by_sub.txt")





