library(dplyr) 

#We Use dplyr function for manipulating grammar

Xtrain <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt")
SubTrain <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
Xtest <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt")
SubTest <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
activityLabels <- read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
features <-read.table("C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

# The Above Data are all for Assigning Data in The Project Datasets to the respective Variables

Xtotal <- rbind(Xtrain, Xtest)   #Merging Row wise  Xtrain and Xtest
Ytotal <- rbind(Ytrain, Ytest)   #Merging Row wise  Ytrain and Ytest
SubTotal <- rbind(SubTrain, SubTest) #Merging Row wise  SubTrain and SubTest

# Below Steps are for selecting values with mean and std using grep function to find text matches 

FilteredVars <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]

FilteredVars <- FilteredVars[c(1:50),]

names(Xtotal) <- FilteredVars[,2]


FilteredVars <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]

FilteredVars <- FilteredVars[c(1:50),]

names(Xtotal) <- FilteredVars[,2]
NewTidyAverage <- NULL

for ( i in 1 : 50 ){
  NewTidyAverage <- c(NewTidyAverage,mean(Xtotal[,i]))
  
  
}
names(NewTidyAverage) <- FilteredVars[,2]

write.table(NewTidyAverage,"C:/Users/SUN/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/NewTidyOutput.txt",col.names = T ,row.names = T)












