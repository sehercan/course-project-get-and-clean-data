# reshape2 library is needed for the functions to be used
library(reshape2)

# Read the test data:
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

# Update the names of y_test and subject_test
names(y_test) <-"activity_labels"
names(subject_test)<- "subject_ID"

# Read the train data:
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# Update the names of y_train and subject_train
names(y_train) <- "activity_labels"
names(subject_train) <- "subject_ID"

# 1: Merges the training and the test sets to create one data set
# Merge test files
test_data <- cbind(x_test, y_test, subject_test)

# Apply the same merging logic to train files
# Merge train files
train_data <- cbind(x_train, y_train, subject_train)

# Now, merge test and train data to get the data ready to work on
my_data <- rbind(test_data, train_data)

# 2: Extracts only the measurements on the mean and standard deviation for each measurement
# Read the column names in features.txt
col_names <- read.table("./features.txt")
names(my_data)<- c(as.character(col_names$V2), "activity_labels", "subject_ID")

# Get the  related variables on my_data
col_names_data <- grepl("mean\\(\\)|std\\(\\)|activity|subject", names(my_data))
my_data <- my_data[,col_names_data]

# 3: Uses descriptive activity names to name the activities in the data set
# mapping can be found on activity_labels.txt
my_data$activity_labels <- as.factor(my_data$activity_labels)
levels(my_data$activity_labels) <- list(WALKING="1", WALKING_UPSTAIRS="2",
                                        WALKING_DOWNSTAIRS="3", SITTING="4", 
                                        STANDING="5", LAYING="6")

# 4: Appropriately labels the data set with descriptive variable names 
#    by removing parantheses.
names(my_data) <- sub("\\(\\)","", names(my_data))

# 5: From the data set in step 3, creates a second, independent 
#    tidy data set with the average of each variable for each activity and each subject.

#use reshape2 package with melting.
melted_data <- melt(my_data, id=c("subject_ID","activity_labels")) 

#cast the data
cast_data <- dcast(melted_data, subject_ID+activity_labels ~ variable,fun.aggregate=mean)

# 6: Write the results to a .txt file to upload Coursera.
write.table(cast_data,"./result.txt",row.name=FALSE )

