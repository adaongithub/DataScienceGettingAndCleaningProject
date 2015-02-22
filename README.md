
##This is the GitHub repository for the Week Three Project for the Data
Science course "Getting and Cleaning Data".

It contains a script "run_analysis.R" which takes data from source [1] and
processes it according to the project problem statement producing the output
tidy data set in the file "step_5_tidy_data.txt" .

The format of the script's output data set ("step_5_tidy_data.txt") is
described in the file "CodeBook.md" .

In outline the operation of the script is:

1. Download the .zip file for the data set using the URL in [2].

2. Read the file activity_labels.txt into a data frame, activity_labels.df .

3. Read the file features.txt into a data frame, features_df .

4. Add a column to features_df with feature names corrected to allow them to be used as data frame column names.

5. Rename any duplicate feature names to ensure unique feature names using make.names().

6. Read subject_test.txt, y_test.txt, and X_test.txt into data frames with appropriate column names.  X_test_df will have corrected feature names naming its columns.

7. Similarly, read subject_train.txt, y_train.txt, and X_train.txt into data frames.

8. Translate activity codes to activity names in y_test_df and y_train_df.

9. Combine the three "test" data frames (subject_test_df, y_test_df, and X_test_df) into a single composite data frame using cbind().

10. Do the same for the training data frames.

11. Stack the combined training data frame on top of the test data frame using rbind().

12. Remove unwanted columns from the combination using select().

13. Summarize by computing the average for each activity for each person using aggregate().

14. Lexicographically order the summary first by subject code then by activity.

15. Finally, write the summary data frame out to a table in file step_5_tidy_data.txt .





[1]
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

[2]
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

