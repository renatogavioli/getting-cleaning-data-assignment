## read activity labels and feature names.
activity_labels <- read.table("activity_labels.txt", sep=" ")
features <- read.table("features.txt", sep=" ")


## the script reads data from train and test data sets, and also sets names for the 
## columns as "Subject", "ActivityLabel" and the features names.
data_train <- cbind(read.table("train/subject_train.txt", col.names="Subject"), 
                    read.table("train/y_train.txt", col.names="ActivityLabel"), 
                    read.table("train/X_train.txt", col.names=features[[2]]))
data_test <- cbind(read.table("test/subject_test.txt", col.names="Subject"), 
                    read.table("test/y_test.txt", col.names="ActivityLabel"), 
                    read.table("test/X_test.txt", col.names=features[[2]]))
## then, it merges all the data in one single data frame, and sets labels for the 
## activities usinr function "factor".
data <- rbind(data_train, data_test)
data[[2]] <- factor(data[[2]], labels=activity_labels[[2]])

## a new file was created, based on the "features.txt" file, as an index of the features
## of interest in this file, i.e. means and standard deviation features, and its column
## numbers. all other features were removed.
features_clean <- read.table("features_clean.txt")

## the script uses this index to subset and clean the data, creating a "data_clean" 
## table. it is necessary to add 2 to this index, in order to account for the first two 
## columns of the data table.
data_clean <- data[c(1, 2, features_clean[[1]]+2)]

## finally the script calculates the means and standard deviations for all the columns, sorted 
## by subject and by activity, then binds it all to a single data frame, which is exported
## as a table(processed_data.txt).
data_mean <- aggregate.data.frame(data_clean[3:length(data_clean)], 
                                by=list(data_clean[[1]], data_clean[[2]]), mean)
names(data_mean)<- paste0(names(data_mean[3:length(data_mean)]),sep="_", "MEAN")
data_sd <- aggregate.data.frame(data_clean[3:length(data_clean)], 
                                by=list(data_clean[[1]], data_clean[[2]]), sd)
names(data_sd)<- paste0(names(data_sd[3:length(data_sd)]),sep="_", "STD")

processed_data<- cbind(data_mean, data_sd[3:length(data_sd)])
write.table(processed_data, file="processed_data.txt")
