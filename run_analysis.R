
# You should create one R script called run_analysis.R that does the following. 

# 1)  Merges the training and the test sets to create one data set.
# 2)  Extracts only the measurements on the mean and standard deviation for
#     each measurement. 
# 3)  Uses descriptive activity names to name the activities in the data set
# 4)  Appropriately labels the data set with descriptive variable names. 
# 5)  From the data set in step 4, creates a second, independent tidy data
#     set with the average of each variable for each activity and each subject.

# We will be using the R package "dplyr".
# It only needs to be installed once so we comment out the call of
# install.packages().
## install.packages( "dplyr" )  
library( dplyr )

# Download to the local file system the basic data set we will be using.
# It only needs to be downloaded once so we comment out the call of
# download.file().
## fileURL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## download.file( fileURL1, destfile="getdata_projectfiles_UCI HAR Dataset.zip")

# 1)  Merges the training and the test sets to create one data set.

# Now manually unzip the above .zip file.  This creates the directory
# "UCI HAR Dataset/" which contains all the input basic data we are concerned
# with in this exercise.
dir <- "data/UCI HAR Dataset/"

# Read components of the input data into R data frames

# Read in the activity_labels.txt and features.txt data files data frames
#   Construct a relative path for the activity_labels.txt file
fname <- paste( dir, "activity_labels.txt", sep="")
#   Actually read in the data frame (df)
## print( paste( "Now reading file", fname ) )
activity_labels_df <- read.table( fname, sep=" ")
#   Since the file doesn't have a header we add our own column names
names( activity_labels_df ) <- c( "ActivityCode", "ActivityName" )

fname <- paste( dir, "features.txt", sep="")
## print( paste( "Now reading file", fname ) )
features_df <- read.table( fname, sep=" ")
names( features_df ) <- c( "FeatureCode", "FeatureName" )

# 3)  Uses descriptive activity names to name the activities in the data set
# 4)  Appropriately labels the data set with descriptive variable names. 

# Some of the feature names are not in the syntax required by R for column
# names; also, there are a number of duplicated feature names to deal with.
# We add a column, "FeatureNameCorrected", to the features_df to hold these
# corrected feature names.
#   Start off with the uncorrected feature names
features_df[, "FeatureNameCorrected" ] <- features_df[, "FeatureName" ]
#   Change some of the illegal characters into legal characters
features_df[, "FeatureNameCorrected"] <- 
                ( gsub( "-", "_", features_df[, "FeatureNameCorrected"] ) )
features_df[, "FeatureNameCorrected"] <- 
                ( gsub( ",", "_", features_df[, "FeatureNameCorrected"] ) )
features_df[, "FeatureNameCorrected"] <- 
                ( gsub( "\\(\\)", "_", features_df[, "FeatureNameCorrected"] ) )

#   Now use make.names() to re-name duplicates to unique feature names
#   and catch any remaining illegal characters (like parens) and change
#   them to ".".
features_df[, "FeatureNameCorrected" ] <- 
	make.names( features_df[, "FeatureNameCorrected"], unique=TRUE )
#   Finally, modify feature names to indicate that they will contain
#   the average of the raw feature values.
features_df[, "FeatureNameCorrected"] <- 
                ( gsub( "^", "Avg_", features_df[, "FeatureNameCorrected"] ) )


# Now read in the "test/" data files as data frames
dir_test <- paste( dir, "test/", sep="" )

fname <- paste( dir_test, "subject_test.txt", sep="")
## print( paste( "Now reading file", fname ) )
subject_test_df <- read.table( fname, sep=" ")
names( subject_test_df ) <- c( "SubjectCode" )

fname <- paste( dir_test, "y_test.txt", sep="")
## print( paste( "Now reading file", fname ) )
y_test_df <- read.table( fname, sep=" ")
names( y_test_df ) <- c( "ActivityCode" )

fname <- paste( dir_test, "X_test.txt", sep="")
## print( paste( "Now reading file", fname ) )
X_test_df <- read.table( fname, header=FALSE, sep="" )
# Use the corrected feature names as column names here
names( X_test_df ) <- features_df$FeatureNameCorrected

# Now read in the "train/" data files as data frames
dir_train <- paste( dir, "train/", sep="" )

fname <- paste( dir_train, "subject_train.txt", sep="")
## print( paste( "Now reading file", fname ) )
subject_train_df <- read.table( fname, sep=" ")
names( subject_train_df ) <- c( "SubjectCode" )

fname <- paste( dir_train, "y_train.txt", sep="")
## print( paste( "Now reading file", fname ) )
y_train_df <- read.table( fname, sep=" ")
names( y_train_df ) <- c( "ActivityCode" )

fname <- paste( dir_train, "X_train.txt", sep="")
## print( paste( "Now reading file", fname ) )
X_train_df <- read.table( fname, header=FALSE, sep="" )
names( X_train_df ) <- features_df$FeatureNameCorrected


# Combine the three "test" data frames (subject_test_df,
# y_test_df with its ActivityCodes translated into ActivityNames as per
# activity_labels_df, and X_test_df) into a single composite data frame,
# test_df.

# First, translate y_test_df from ActivityCodes to ActivityNames
activity_names_test_df <- 
	data_frame( ActivityName = 
		   	activity_labels_df[y_test_df[,"ActivityCode"],2] )
names( activity_names_test_df ) <- c( "ActivityName" )
test_df <- cbind( subject_test_df, activity_names_test_df, X_test_df )

# Similarly, combine the three "train" data frames (subject_train_df,
# y_train_df, and X_train_df) into a single composite data frame, train_df.

# Translate y_train_df from ActivityCodes to ActivityNames
activity_names_train_df <- 
	data_frame( ActivityName = 
		   	activity_labels_df[y_train_df[,"ActivityCode"],2] )
names( activity_names_train_df ) <- c( "ActivityName" )
train_df <- cbind( subject_train_df, activity_names_train_df, X_train_df )

# Now, "combind" all the observations from the training data set and the 
# test data set
overall_df <- rbind( train_df, test_df )


## Create a second, independent tidy data set with the average of each
## variable computed for each activity and each subject.

# 2)  Extracts only the measurements on the mean and standard deviation for
#     each measurement. 

# Set intermediate values before summarizing with aggregate() .

# We only summarize those features with "mean" (upper or lower case) or with
# "std" (upper or lower case) in their names. Create a new data frame
# with only the columns of overall_df that we're interested in.
selected_mean_std_df <- 
	select( overall_df, SubjectCode, ActivityName, 
	       		    contains("mean", ignore.case=TRUE),
			    contains("std", ignore.case=TRUE) )

# 5)  From the data set in step 4, creates a second, independent tidy data
#     set with the average of each variable for each activity and each subject.

byList <- list( selected_mean_std_df$SubjectCode,
	        selected_mean_std_df$ActivityName )
summary_df <- aggregate(selected_mean_std_df[-(1:2)], by=byList, FUN="mean")
# Replace the dummy names put in by aggregate() with the the actual names.
names(summary_df)[1] <- names(selected_mean_std_df)[1]
names(summary_df)[2] <- names(selected_mean_std_df)[2]
## Sort rows in ascending order by SubjectCode then by ActivityName
reorder <- order(summary_df$SubjectCode, summary_df$ActivityName)
sorted_summary_df <- summary_df[reorder,]

# Finally, write the tidy data set as a text file without the row name
# that was added when sorted_df was created and without headers.
write.table( sorted_summary_df, file="step_5_tidy_data.txt", row.name=FALSE )

# Note: To read this text file back in use:
#   sorted_summary_read_in_df <- 
#   	read.table( file="step_5_tidy_data.txt", sep="", header=TRUE )

