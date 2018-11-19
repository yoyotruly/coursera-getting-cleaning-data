library(dplyr)

# Set working directory to your local folder
setwd("Desktop/Coursera/Data/UCI HAR Dataset")

# Import and combine the X, Y and subject number for the train dataset
X_train <- read.table("train/X_train.txt")
Y_train <- read.table("train/Y_train.txt", col.names = "ind")
sub_train <- read.table("train/subject_train.txt", col.names = "subject")
train <- cbind(dataset = rep("train", nrow(X_train)), sub_train, Y_train, X_train)

# Import and combine the X, Y and subject number for the test dataset
X_test <- read.table("test/X_test.txt")
Y_test <- read.table("test/Y_test.txt", col.names = "ind")
sub_test <- read.table("test/subject_test.txt", col.names = "subject")
test <- cbind(dataset = rep("test", nrow(X_test)), sub_test, Y_test, X_test)

# Combine train and test
combined <- rbind(train, test)

# Label variables V1 through V561 with descriptive names
features <- read.table("features.txt", stringsAsFactors = FALSE)
names(combined)[4:564] <- features$V2

# Extract only measurements of mean and standard deviation
index_ms <- grepl("(mean|std)\\(", names(combined))
combined_ms <- combined[, c("dataset", "subject", "ind", names(combined)[index_ms])]

# Label activities in the dataset with descriptive names
labels <- read.table("activity_labels.txt", col.names = c("ind", "activity"))
comb <- merge(labels, combined_ms, by = "ind")

# Creates tidy data set with the average of each variable for each activity and each subject
ave <- comb %>% 
    group_by(activity, subject) %>% 
    summarise_at(5:70, mean)

# export file
write.table(ave, "average.txt", row.names = FALSE)
