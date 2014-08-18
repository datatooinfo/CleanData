X_test  
Input file 
X_test.txt. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

X_train 
Input file 
X_train.txt. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Features  
Input file 
features.txt. List of features normalized and bounded within [-1,1].  Each feature vector is a row on the text file.

SubjectTest  
Input file 
subject_test.txt. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

SubjectTrain 
Input file 
subject_train.txt. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

spFeatures  
Created file. 
Subset of features.txt maintaining variable names as a vector.

names  
Process of converting variable names for files X_test and X_train using the vector created in spFeatures. The variable name for SubjectTest and SubjectTrain are converted to "Subject”.
 
X_test_combine 
Created file. 
Combines SubjectTest and X_test into one data set.

X_train_combine 
Created file. 
Combines SujectTrain and X_train into one data set.

mergeData 
Created file. 
Merges X_test_combine and X_train_combine into one data set.

mean_colname 
Created file. 
A group of column numbers with “mean” in the variable name used to subset mergeData and calculate the mean for those columns only.

SD_colname 
Created file. 
A group of column numbers with “std” in the variable name used to subset mergeData and calculate the standard deviation for those columns only.

AVE_colname 
Created file. 
A group of all variables used to calculate the mean for all columns.

projectmean  
Created file. 
Output containing the mean values for all variables with “mean” in the variable name.

projectSD 
Created file. 
Output containing the standard deviations for all variables with “std” in the variable name.

projectAVE 
Created file. 
Output containing the mean for all variables.

