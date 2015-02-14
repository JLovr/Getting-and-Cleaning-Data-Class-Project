# Code Book for Getting and Cleaning Data Course Project

## GettingandCleaningClassProjectResults.txt features and format

## Source data
Sourced from: 
>==================================================================
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

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

>For each record it is provided:
======================================

>- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
>- Triaxial Angular velocity from the gyroscope. 
>- A 561-feature vector with time and frequency domain variables. 
>- Its activity label. 
>- An identifier of the subject who carried out the experiment.

>The dataset includes the following files:
=========================================

>- 'README.txt'

>- 'features_info.txt': Shows information about the variables used on the feature vector.

>- 'features.txt': List of all features.

>- 'activity_labels.txt': Links the class labels with their activity name.

>- 'train/X_train.txt': Training set.

>- 'train/y_train.txt': Training labels.

>- 'test/X_test.txt': Test set.

>- 'test/y_test.txt': Test labels.

>The following files are available for the train and test data. Their descriptions are equivalent. 

>- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

>- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

>- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

>- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

>Notes: 
======
>- Features are normalized and bounded within [-1,1].
>- Each feature vector is a row on the text file.

>For more information about this dataset contact: activityrecognition@smartlab.ws

>License:
========
>Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

>[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

>This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

>Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012._

>Provided via zip  file by class instructors along with supporting README (excerpts below).

>## Description of original measurement data (copied from feature_info.txt file documentation)
>Feature Selection 
=================

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

>tBodyAcc-XYZ
>tGravityAcc-XYZ
>tBodyAccJerk-XYZ
>tBodyGyro-XYZ
>tBodyGyroJerk-XYZ
>tBodyAccMag
>tGravityAccMag
>tBodyAccJerkMag
>tBodyGyroMag
>tBodyGyroJerkMag
>fBodyAcc-XYZ
>fBodyAccJerk-XYZ
>fBodyGyro-XYZ
>fBodyAccMag
>fBodyAccJerkMag
>fBodyGyroMag
>fBodyGyroJerkMag

>The set of variables that were estimated from these signals are: 

>mean(): Mean value
>std(): Standard deviation
>mad(): Median absolute deviation 
>max(): Largest value in array
>min(): Smallest value in array
>sma(): Signal magnitude area
>energy(): Energy measure. Sum of the squares divided by the number of values. 
>iqr(): Interquartile range 
>entropy(): Signal entropy
>arCoeff(): Autorregresion coefficients with Burg order equal to 4
>correlation(): correlation coefficient between two signals
>maxInds(): index of the frequency component with largest magnitude
>meanFreq(): Weighted average of the frequency components to obtain a mean frequency
>skewness(): skewness of the frequency domain signal 
>kurtosis(): kurtosis of the frequency domain signal 
>bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
>angle(): Angle between to vectors.

>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

>gravityMean
>tBodyAccMean
>tBodyAccJerkMean
>tBodyGyroMean
>tBodyGyroJerkMean

>The complete list of variables of each feature vector is available in 'features.txt'_


#Description of resultant data
1. Means and standard deviation values were extracted and averaged.
2. Base variables extracted had the substrings _mean()_, _std()_, _meanFreq()_, or _gravityMean_, _tBodyAccMean_, _tBodyAccJerkMean_, _tBodyGyroMean_, tBodyGyroJerkMean_ in their names.  The uniqueness function was employed to avoid overlap.
3. It was decided to keep the averaged vectors (gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean) as in the resultant dataframe they could provide a useful breakdown relevant to the desired dataset, particularly as their exact formulation was not disclosed.
4. To reduce confusion when comparing the source datasets to the resultant dataset, resultant dataset column names were chosen to consist of the source column name with alphanumeric characters removed and the first letter capitalized, prepended by _Avg_.

## Units of measure
1. Acceleration is measured in g's (approximately 9.8 meters per second squared).
2. Angles are measured in radians.
3. A clear basis for frequency calculations can be derived from the author's documentation above.  Not being a mind reader and given what was stated, I am assuming that these numbers are a result of applying an FFT normalized to a -1:+1 range based on some mean on a 50Hz range.

##List of Result Table Column Names:
__Column Names__			__Key Values__  
 [1] "Activity"         (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)                   
 [2] "Subject"          (1:30)                   
 [3] "AvgTBodyAccmeanX"                    
 [4] "AvgTBodyAccmeanY"                    
 [5] "AvgTBodyAccmeanZ"                    
 [6] "AvgTBodyAccstdX"                     
 [7] "AvgTBodyAccstdY"                     
 [8] "AvgTBodyAccstdZ"                     
 [9] "AvgTGravityAccmeanX"                 
[10] "AvgTGravityAccmeanY"                 
[11] "AvgTGravityAccmeanZ"                 
[12] "AvgTGravityAccstdX"                  
[13] "AvgTGravityAccstdY"                  
[14] "AvgTGravityAccstdZ"                  
[15] "AvgTBodyAccJerkmeanX"                
[16] "AvgTBodyAccJerkmeanY"                
[17] "AvgTBodyAccJerkmeanZ"                
[18] "AvgTBodyAccJerkstdX"                 
[19] "AvgTBodyAccJerkstdY"                 
[20] "AvgTBodyAccJerkstdZ"                 
[21] "AvgTBodyGyromeanX"                   
[22] "AvgTBodyGyromeanY"                   
[23] "AvgTBodyGyromeanZ"                   
[24] "AvgTBodyGyrostdX"                    
[25] "AvgTBodyGyrostdY"                    
[26] "AvgTBodyGyrostdZ"                    
[27] "AvgTBodyGyroJerkmeanX"               
[28] "AvgTBodyGyroJerkmeanY"               
[29] "AvgTBodyGyroJerkmeanZ"               
[30] "AvgTBodyGyroJerkstdX"                
[31] "AvgTBodyGyroJerkstdY"                
[32] "AvgTBodyGyroJerkstdZ"                
[33] "AvgTBodyAccMagmean"                  
[34] "AvgTBodyAccMagstd"                   
[35] "AvgTGravityAccMagmean"               
[36] "AvgTGravityAccMagstd"                
[37] "AvgTBodyAccJerkMagmean"              
[38] "AvgTBodyAccJerkMagstd"               
[39] "AvgTBodyGyroMagmean"                 
[40] "AvgTBodyGyroMagstd"                  
[41] "AvgTBodyGyroJerkMagmean"             
[42] "AvgTBodyGyroJerkMagstd"              
[43] "AvgFBodyAccmeanX"                    
[44] "AvgFBodyAccmeanY"                    
[45] "AvgFBodyAccmeanZ"                    
[46] "AvgFBodyAccstdX"                     
[47] "AvgFBodyAccstdY"                     
[48] "AvgFBodyAccstdZ"                     
[49] "AvgFBodyAccmeanFreqX"                
[50] "AvgFBodyAccmeanFreqY"                
[51] "AvgFBodyAccmeanFreqZ"                
[52] "AvgFBodyAccJerkmeanX"                
[53] "AvgFBodyAccJerkmeanY"                
[54] "AvgFBodyAccJerkmeanZ"                
[55] "AvgFBodyAccJerkstdX"                 
[56] "AvgFBodyAccJerkstdY"                 
[57] "AvgFBodyAccJerkstdZ"                 
[58] "AvgFBodyAccJerkmeanFreqX"            
[59] "AvgFBodyAccJerkmeanFreqY"            
[60] "AvgFBodyAccJerkmeanFreqZ"            
[61] "AvgFBodyGyromeanX"                   
[62] "AvgFBodyGyromeanY"                   
[63] "AvgFBodyGyromeanZ"                   
[64] "AvgFBodyGyrostdX"                    
[65] "AvgFBodyGyrostdY"                    
[66] "AvgFBodyGyrostdZ"                    
[67] "AvgFBodyGyromeanFreqX"               
[68] "AvgFBodyGyromeanFreqY"               
[69] "AvgFBodyGyromeanFreqZ"               
[70] "AvgFBodyAccMagmean"                  
[71] "AvgFBodyAccMagstd"                   
[72] "AvgFBodyAccMagmeanFreq"              
[73] "AvgFBodyBodyAccJerkMagmean"          
[74] "AvgFBodyBodyAccJerkMagstd"           
[75] "AvgFBodyBodyAccJerkMagmeanFreq"      
[76] "AvgFBodyBodyGyroMagmean"             
[77] "AvgFBodyBodyGyroMagstd"              
[78] "AvgFBodyBodyGyroMagmeanFreq"         
[79] "AvgFBodyBodyGyroJerkMagmean"         
[80] "AvgFBodyBodyGyroJerkMagstd"          
[81] "AvgFBodyBodyGyroJerkMagmeanFreq"     
[82] "AvgAngletBodyAccMeangravity"         
[83] "AvgAngletBodyAccJerkMeangravityMean"  
[84] "AvgAngletBodyGyroMeangravityMean"    
[85] "AvgAngletBodyGyroJerkMeangravityMean"  
[86] "AvgAngleXgravityMean"                 
[87] "AvgAngleYgravityMean"                
[88] "AvgAngleZgravityMean"    

