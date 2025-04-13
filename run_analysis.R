# run_analysis.R

# Load required packages
library(dplyr)

# 1. Read the data
features <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# 2. Merge the training and test sets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# 3. Name the columns
colnames(x_data) <- features$V2
colnames(subject_data) <- "subject"
colnames(y_data) <- "activity"

# 4. Extract only the measurements on the mean and standard deviation
mean_std_data <- x_data[, grep("mean\\(\\)|std\\(\\)", features$V2)]

# 5. Combine data
all_data <- cbind(subject_data, y_data, mean_std_data)

# 6. Use descriptive activity names
all_data$activity <- factor(all_data$activity, levels = activities$code, labels = activities$activity)

# 7. Label the dataset with descriptive variable names
names(all_data) <- gsub("^t", "Time", names(all_data))
names(all_data) <- gsub("^f", "Frequency", names(all_data))
names(all_data) <- gsub("Acc", "Accelerometer", names(all_data))
names(all_data) <- gsub("Gyro", "Gyroscope", names(all_data))
names(all_data) <- gsub("Mag", "Magnitude", names(all_data))
names(all_data) <- gsub("BodyBody", "Body", names(all_data))
names(all_data) <- gsub("-mean\\(\\)", "Mean", names(all_data))
names(all_data) <- gsub("-std\\(\\)", "STD", names(all_data))
names(all_data) <- gsub("-", "", names(all_data))

# 8. Create tidy dataset with the average of each variable for each activity and subject
tidy_dataset <- all_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# 9. Write tidy dataset to file
write.table(tidy_dataset, "tidy_dataset.txt", row.names = FALSE)
