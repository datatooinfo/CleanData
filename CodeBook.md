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

Y_test
Input file
y_test.txt Each row identifies the activity performed for each window sample. Its range is from 1 to 6.

Y_train
Input file
y_train.txt Each row identifies the activity performed for each window sample. Its range is from 1 to 6.

spFeatures  
Created file. 
Subset of features.txt maintaining variable names as a vector.

names  
Process of converting variable names for files X_test and X_train using the vector created in spFeatures. The variable name for SubjectTest and SubjectTrain are converted to "Subject”. The variable name for Y_test and Y_train are converted to "Activity".
 
X_test_combine 
Created file. 
Combines SubjectTest and X_test into one data set.

X_train_combine 
Created file. 
Combines SujectTrain and X_train into one data set.

mergeData 
Created file. 
Merges X_test_combine and X_train_combine into one data set.

mergeDataAgg
Created file.
Calculated the mean by activitiy for all colunes in mergeData.

colave
Created file.
Calculates the colMeans for all columns in mergeDataAgg.

rowave
Created file.
Calculates the rowMeans for all rows in mergeDataAgg.

mergeDataAggRow
Created file.
Attaches the averages column to mergeDataAgg

rowavespace Created file. Contains one value, 0.
rowave2 Created file. Attaches rowavespace to rowave to allow the appropriate length for the cbind process

mergeDataAggComplete 
Created file.
Attaches the row averages to mergeDataAggRow.

mean_colname 
Created file. 
A group of column numbers with “mean” in the variable name used to subset mergeData and calculate the mean for those columns only.

SD_colname 
Created file. 
A group of column numbers with “std” in the variable name used to subset mergeData and calculate the standard deviation for those columns only.

projectmean  
Created file. 
Output containing the mean values for all variables with “mean” in the variable name.

projectSD 
Created file. 
Output containing the standard deviations for all variables with “std” in the variable name.

projectAVE 
Created file. 
Output containing the mean for all variables.

