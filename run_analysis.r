#run_analysis.R
#Script is used for the UCI machine learning data set for human activity reconigition using smartphones. 

library(data.table)
library(reshape2)

#Merges train and test data, takes in baseDir (root dir of train and test), activity labels, and feature labels
merge_Train_Test <- function(baseDir = "", activity, feature) {
  #Get train sets
  train.subject <- read.table(file.path(baseDir, "/train/subject_train.txt"))
  train.x <- read.table(file.path(baseDir, "/train/x_train.txt"))
  train.y <- read.table(file.path(baseDir, "/train/y_train.txt"))
  #Get Test Sets
  test.subject <- read.table(file.path(baseDir, "/test/subject_test.txt"))
  test.x <- read.table(file.path(baseDir, "/test/x_test.txt"))
  test.y <- read.table(file.path(baseDir, "/test/y_test.txt"))
  
  #Merge the 3 together
  merged.x <- rbind(train.x, test.x)
  names(merged.x) <- feature[, 2]
  merged.y <- rbind(train.y, test.y)
  merged.y[,1] = activity[merged.y[,1], 2]
  names(merged.y) <- "activity"
  merged.subject <- rbind(train.subject, test.subject)
  names(merged.subject) <- "subject"
  
  #Only get the mean and std deviation of each measurement
  filters <- grep("-mean|-std", names(merged.x))
  merged.x.mean_std <- merged.x[,c(filters)]
  merged.data <- cbind(merged.subject, merged.y, merged.x.mean_std)
}


#script gets the features and activities first
baseDir <- "DataSet"
acts <- read.table(file.path(baseDir, 'activity_labels.txt'), header= FALSE, colClasses="character")
feats <- read.table(file.path(baseDir, 'features.txt'), header= FALSE, colClasses="character")

#Then gets the data from train and test data
data <- merge_Train_Test(baseDir, acts, feats)

melted = melt(data, id.var = c("subject", "activity"))
means = dcast(melted , subject + activity ~ variable, mean)

# Save the resulting dataset
write.table(means, file=file.path(baseDir, "tidy_data.txt"))