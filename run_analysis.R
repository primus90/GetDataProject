##test data set up
##obtain measurement variable name from feature.txt
setwd("C:/Data Science Course/Getting and Cleaning Data/Project/UCI HAR Dataset")
f <- read.table("features.txt")
f$V2 <- as.character(f$V2)
features <- f$V2
features <- gsub("-","",features)  ##remove hyphens from measurement variable name
features <- gsub("\\(","",features)  ##remove left paren from measurement variable name
features <- gsub("\\)","",features)  ##remove right paren from measurement variable name
features <- gsub(",","",features)  ##remove comma from measuresment variable name
##1 Set wd to the test directory 
##The test directory has the following 3 text files. The three text files contain the test data
setwd("C:/Data Science Course/Getting and Cleaning Data/Project/UCI HAR Dataset/test")
testsub <- read.table("subject_test.txt")
##the subject vector is all users who participated in the test activities
##str(table) 2947 rows 1 variable
testx <- read.table("x_test.txt")
##str(xtest) = 2947 rows 561 variables
testy<- read.table("y_test.txt")
##str(y)  2497 rows 1 variable corresponds to activities
##table(y) consists of the following  
## 1   2   3   4   5   6 
##496 471 420 491 532 537

##change variable names to useful variable names 
colnames(testsub)<- "subject"
colnames(testy) <- "activity"
colnames(testx) <- features
##combine testsub,testy and testx dataframes using cbind to create test data dataframe
dftest <- cbind(testsub,testy,testx)

##set wd to where the train data files are located
setwd("C:/Data Science Course/Getting and Cleaning Data/Project/UCI HAR Dataset/train")
trainsub <- read.table("subject_train.txt")
trainx <- read.table("x_train.txt")
trainy <- read.table("y_train.txt")
colnames(trainsub) <- "subject"
colnames(trainy) <- "activity"
colnames(trainx) <- features
##combine trainsub,trainx,trainy datataframes using cbind to create train data dataframe
dftrain <- cbind(trainsub,trainy,trainx)


##combine training data and test data into one dataframe

data <- rbind(dftrain,dftest)
data$activity <- as.character(data$activity)
data$activity[data$activity=="1"] <- "WALKING"
data$activity[data$activity=="2"] <- "WALKING_UPSTAIRS"
data$activity[data$activity=="3"] <- "WALKING_DOWNSTAIRS"
data$activity[data$activity=="4"] <- "SITTING"
data$activity[data$activity=="5"] <- "STANDING"
data$activity[data$activity=="6"] <- "LAYING"


mean <- data[,grep("[Mm]ean",colnames(data))]
sd <- data[,grep("std",colnames(data))]
meanAndSd <- cbind(mean,sd)
write.csv(meanAndSd,"meanAndSd.csv")




y <- colMeans(data[,c(3:563)],na.rm=FALSE)
b <- c("average","variable")
j <- c(b,y)
tidydata <- rbind(data,j)
write.table(tidydata,"tidydata.txt",row.names=FALSE)