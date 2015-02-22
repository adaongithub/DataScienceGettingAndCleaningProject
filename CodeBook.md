
##CodeBook for the Getting and Cleaning Data Project


The variables (data set columns) in this data set (file "step_5_tidy_data.txt")
are derived from the data provided in the data set "Human Activity Recognition
Using Smartphones Data Set" gathered by Anguita et al., 2013 [1].

The file "step_5_tidy_data.txt" is produced from the data provided by [2]
by our R programming language script "run_analysis.R" .  The operation of
this script is outlined in the accompanying "README.md" file.

Because of the complexity of the data gathering and processing involved we
must refer the reader to [2] for details of the data upon which our data is
based.  Below we include as Appendices A and B two descriptive files from [2].

The data in [2] was taken from 30 human volunteers while performing each of six
activities: walking, walking_upstairs, walking_downstairs, sitting, standing,
and laying.  Each person performed each activity a number of times.

The data here is a summary of a subset of the data gathered in [2].
We are only concerned with those variables which report a mean or
standard deviation for the time series data underlying [2]. There are
86 such variables.  For these variables, we compute the average of all
instances performed for each activity by each person.
This gives a total of 180 observations (table rows) in our summary data set.
The summary data set has 88 columns: a subject code, an activity name, and
the 86 derived averages.  The average values are decimal numbers in the
range -1 to +1 with seven digits of precision.  (Note, it is not clear from
[2] how many of these seven digits are significant.)

Below are our 88 variables (table columns).


 1) "SubjectCode"                     An integer [1,30] coding the person
                                      performing the different activities

 2) "ActivityName"                    The name of the activity performed:
                                        WALKING, WALKING_UPSTAIRS,
                                        WALKING_DOWNSTAIRS, SITTING,
                                        STANDING, LAYING

     Average values of 86 selected variables in the original data set in [2].
     See the file "features.txt" from [2] for the full listing of variables.
     The names here correspond to the name used in [2] with a pre-pended
     "Avg_" and character substitutions to allow for syntactic requirements
     of the R programming language for representing data frame column names.
     Again, because of the complexity of the experimental situation and
     initial processing of the raw data, the reader is referred to [2] for
     details - see Appendices.

 3) "Avg_tBodyAcc_mean__X"                    
 4) "Avg_tBodyAcc_mean__Y"                    
 5) "Avg_tBodyAcc_mean__Z"                    
 6) "Avg_tGravityAcc_mean__X"                 
 7) "Avg_tGravityAcc_mean__Y"                 
 8) "Avg_tGravityAcc_mean__Z"                 
 9) "Avg_tBodyAccJerk_mean__X"                
10) "Avg_tBodyAccJerk_mean__Y"                
11) "Avg_tBodyAccJerk_mean__Z"                
12) "Avg_tBodyGyro_mean__X"                   
13) "Avg_tBodyGyro_mean__Y"                   
14) "Avg_tBodyGyro_mean__Z"                   
15) "Avg_tBodyGyroJerk_mean__X"               
16) "Avg_tBodyGyroJerk_mean__Y"               
17) "Avg_tBodyGyroJerk_mean__Z"               
18) "Avg_tBodyAccMag_mean_"                   
19) "Avg_tGravityAccMag_mean_"                
20) "Avg_tBodyAccJerkMag_mean_"               
21) "Avg_tBodyGyroMag_mean_"                  
22) "Avg_tBodyGyroJerkMag_mean_"              
23) "Avg_fBodyAcc_mean__X"                    
24) "Avg_fBodyAcc_mean__Y"                    
25) "Avg_fBodyAcc_mean__Z"                    
26) "Avg_fBodyAcc_meanFreq__X"                
27) "Avg_fBodyAcc_meanFreq__Y"                
28) "Avg_fBodyAcc_meanFreq__Z"                
29) "Avg_fBodyAccJerk_mean__X"                
30) "Avg_fBodyAccJerk_mean__Y"                
31) "Avg_fBodyAccJerk_mean__Z"                
32) "Avg_fBodyAccJerk_meanFreq__X"            
33) "Avg_fBodyAccJerk_meanFreq__Y"            
34) "Avg_fBodyAccJerk_meanFreq__Z"            
35) "Avg_fBodyGyro_mean__X"                   
36) "Avg_fBodyGyro_mean__Y"                   
37) "Avg_fBodyGyro_mean__Z"                   
38) "Avg_fBodyGyro_meanFreq__X"               
39) "Avg_fBodyGyro_meanFreq__Y"               
40) "Avg_fBodyGyro_meanFreq__Z"               
41) "Avg_fBodyAccMag_mean_"                   
42) "Avg_fBodyAccMag_meanFreq_"               
43) "Avg_fBodyBodyAccJerkMag_mean_"           
44) "Avg_fBodyBodyAccJerkMag_meanFreq_"       
45) "Avg_fBodyBodyGyroMag_mean_"              
46) "Avg_fBodyBodyGyroMag_meanFreq_"          
47) "Avg_fBodyBodyGyroJerkMag_mean_"          
48) "Avg_fBodyBodyGyroJerkMag_meanFreq_"      
49) "Avg_angle.tBodyAccMean_gravity."         
50) "Avg_angle.tBodyAccJerkMean._gravityMean."
51) "Avg_angle.tBodyGyroMean_gravityMean."    
52) "Avg_angle.tBodyGyroJerkMean_gravityMean."
53) "Avg_angle.X_gravityMean."                
54) "Avg_angle.Y_gravityMean."                
55) "Avg_angle.Z_gravityMean."                
56) "Avg_tBodyAcc_std__X"                     
57) "Avg_tBodyAcc_std__Y"                     
58) "Avg_tBodyAcc_std__Z"                     
59) "Avg_tGravityAcc_std__X"                  
60) "Avg_tGravityAcc_std__Y"                  
61) "Avg_tGravityAcc_std__Z"                  
62) "Avg_tBodyAccJerk_std__X"                 
63) "Avg_tBodyAccJerk_std__Y"                 
64) "Avg_tBodyAccJerk_std__Z"                 
65) "Avg_tBodyGyro_std__X"                    
66) "Avg_tBodyGyro_std__Y"                    
67) "Avg_tBodyGyro_std__Z"                    
68) "Avg_tBodyGyroJerk_std__X"                
69) "Avg_tBodyGyroJerk_std__Y"                
70) "Avg_tBodyGyroJerk_std__Z"                
71) "Avg_tBodyAccMag_std_"                    
72) "Avg_tGravityAccMag_std_"                 
73) "Avg_tBodyAccJerkMag_std_"                
74) "Avg_tBodyGyroMag_std_"                   
75) "Avg_tBodyGyroJerkMag_std_"               
76) "Avg_fBodyAcc_std__X"                     
77) "Avg_fBodyAcc_std__Y"                     
78) "Avg_fBodyAcc_std__Z"                     
79) "Avg_fBodyAccJerk_std__X"                 
80) "Avg_fBodyAccJerk_std__Y"                 
81) "Avg_fBodyAccJerk_std__Z"                 
82) "Avg_fBodyGyro_std__X"                    
83) "Avg_fBodyGyro_std__Y"                    
84) "Avg_fBodyGyro_std__Z"                    
85) "Avg_fBodyAccMag_std_"                    
86) "Avg_fBodyBodyAccJerkMag_std_"            
87) "Avg_fBodyBodyGyroMag_std_"               
88) "Avg_fBodyBodyGyroJerkMag_std_"




References:

[1]
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

[2]
Human Activity Recognition Using Smartphones Data Set,
UC Irvine Machine Learning Repository,
Center for Machine Learning and Intelligent System,
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Accessed 2015-02-21



##Appendix A - README.txt =====================================================

 ==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
 ==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
 ==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
 ======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
 =========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
 ======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
 ========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


##Appendix B - features_info.txt ==============================================

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


