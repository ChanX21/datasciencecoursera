library(dplyr) 

#We Use dplyr function for manipulating grammar

Xtrain <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt")
SubTrain <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
Xtest <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt")
SubTest <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
variableNames <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
activityLabels <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")


# The Above Data are all for Assigning Data in The Project Datasets to the respective Variables

Xtotal <- rbind(Xtrain, Xtest)   #Merging Row wise  Xtrain and Xtest
Ytotal <- rbind(Ytrain, Ytest)   #Merging Row wise  Ytrain and Ytest
SubTotal <- rbind(SubTrain, SubTest) #Merging Row wise  SubTrain and SubTest

# Below Steps are for selecting values with mean and std using grep function to find text matches 

selectedVars <- variableNames[grep("mean\\(\\)|std\\(\\)",variableNames[,2]),]
Xtotal <- Xtotal[,selectedVars[,1]]
colnames(Ytotal) <- "Activity" 
Ytotal$activityLabels <- factor(Ytotal$activity, labels = as.character(activityLabels[,2]))
activityLabels <- Ytotal[,-1]
colnames(Xtotal) <- variableNames[selectedVars[,1],2]
colnames(SubTotal) <- "Subject"
Total <- cbind(Xtotal, activityLabels, SubTotal)
MeanTotal <- Total %>% group_by(activityLabels, subject) %>% summarize_each(funs(mean))

# The Final Clean Data File is written out as a Text File 

write.table(MeanTotal, file = "C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/NewCleanData.txt", row.names = FALSE, col.names = TRUE)
