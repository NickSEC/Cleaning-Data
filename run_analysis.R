setwd("/Users/nicklukianoff/Desktop/Clean Data/UCI HAR Dataset")

#Read in the test sets
test1 <- read.fwf(file = "test/X_test.txt", widths = c(rep(16,6),rep(-16,35), rep(16,6),rep(-16,35), rep(16,6),rep(-16,35), rep(16,6),rep(-16,35), rep(16,6),rep(-16,35), rep(16,2),rep(-16,11), rep(16,2),rep(-16,11), rep(16,2),rep(-16,11), rep(16,2),rep(-16,11), rep(16,2),rep(-16,11),rep(16,6),rep(-16,35), rep(16,6),rep(-16,73), rep(16,6),rep(-16,73), rep(16,2),rep(-16,11), rep(16,2),rep(-16,11), rep(16,2),rep(-16,11), rep(16,2),rep(-16,11)), header = FALSE)
test2 <- read.csv("test/y_test.txt", header = FALSE)
test3 <- read.csv("test/subject_test.txt", header = FALSE)

#Read in the training sets
train1 <- read.fwf(file = "train/X_train.txt", widths = c(rep(16,6),rep(-16,35), rep(16,6),rep(-16,35), rep(16,6),rep(-16,35), rep(16,6),rep(-16,35), rep(16,6),rep(-16,35), rep(16,2),rep(-16,11), rep(16,2),rep(-16,11), rep(16,2),rep(-16,11), rep(16,2),rep(-16,11), rep(16,2),rep(-16,11),rep(16,6),rep(-16,35), rep(16,6),rep(-16,73), rep(16,6),rep(-16,73), rep(16,2),rep(-16,11), rep(16,2),rep(-16,11), rep(16,2),rep(-16,11), rep(16,2),rep(-16,11)), header = FALSE)
train2 <- read.csv("train/y_train.txt", header = FALSE)
train3 <- read.csv("train/subject_train.txt", header = FALSE)

#Read in descriptive files
features <- read.csv("features.txt", sep = " ", header = FALSE)
activity <- read.csv("activity_labels.txt", sep = " ", header = FALSE)
names(test2)[1] <- "Activity"
names(train2)[1] <- "Activity"

#Assign column names to test & training sets
colnames(test1) <- c(as.character(features[1:6,2]),as.character(features[41:46,2]),as.character(features[81:86,2]),as.character(features[121:126,2]),as.character(features[161:166,2]),as.character(features[201:202,2]),as.character(features[214:215,2]),as.character(features[227:228,2]),as.character(features[240:241,2]),as.character(features[253:254,2]),as.character(features[266:271,2]),as.character(features[345:350,2]),as.character(features[424:429,2]),as.character(features[503:504,2]),as.character(features[516:517,2]),as.character(features[529:530,2]),as.character(features[542:543,2]))
colnames(train1) <- c(as.character(features[1:6,2]),as.character(features[41:46,2]),as.character(features[81:86,2]),as.character(features[121:126,2]),as.character(features[161:166,2]),as.character(features[201:202,2]),as.character(features[214:215,2]),as.character(features[227:228,2]),as.character(features[240:241,2]),as.character(features[253:254,2]),as.character(features[266:271,2]),as.character(features[345:350,2]),as.character(features[424:429,2]),as.character(features[503:504,2]),as.character(features[516:517,2]),as.character(features[529:530,2]),as.character(features[542:543,2]))

#Add in activities to each data set
test2$Act_Name <- activity[test2[,1],2]
train2$Act_Name <- activity[train2[,1],2]
test4 <- cbind(test1,test2)
train4 <- cbind(train1,train2)

#Add in identifiers to each data set
test5 <- cbind(test3,test4)
train5 <- cbind(train3,train4)
names(test5)[1] <- "Person"
names(train5)[1] <- "Person"

#Merge the data sets
bigdata <- rbind(train5,test5)

#Take the average and standard deviation of all variables, broken down by person
bigdata2 <- aggregate(x=bigdata[2:67], FUN = mean, by = list(Person = bigdata$Person, Activity = bigdata$Activity))

write.table(bigdata2, "tidy_table.txt", sep=" ")
