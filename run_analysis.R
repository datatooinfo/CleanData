#Read files into R
X_test <- read.table("c:/rWork/X_test.txt", header=FALSE,
                     stringsAsFactors = FALSE);
X_train <- read.table("c:/rWork/X_train.txt", header=FALSE,
                     stringsAsFactors = FALSE);         
Features <- read.table("c:/rWork/features.txt", header=FALSE,
                      stringsAsFactors = FALSE);
SubjectTest <- read.table("c:/rWork/subject_test.txt", header=FALSE,
                       stringsAsFactors = FALSE);
SubjectTrain <- read.table("c:/rWork/subject_train.txt", header=FALSE,
                       stringsAsFactors = FALSE);
Y_test <- read.table("c:/rWork/y_test.txt", header=FALSE,
                      stringsAsFactors = FALSE);         
Y_train <- read.table("c:/rWork/y_train.txt", header=FALSE,
                      stringsAsFactors = FALSE)         


#Create a vector of variable names
spFeatures <- c(Features[,2])           

#Assign variable names
names(X_test) <- c(spFeatures)
names(X_train) <- c(spFeatures)
names(SubjectTest) <- c("Subject")
names(SubjectTrain) <- c("Subject")
names(Y_test) <- c("Activity")
names(Y_train) <- c("Activity")  

#Combine Subject and Data files
X_test_combine <- cbind(Y_test, SubjectTest, X_test)
X_train_combine <- cbind(Y_train, SubjectTrain, X_train) 

#Merge Data files
mergeData <- merge(X_test_combine, X_train_combine,
                     by.x="Subject", by.y="Subject",
                     all=TRUE, na.rm=TRUE)

mergeDataAgg <- aggregate(mergeData[,3:1125],by=list(mergeData$Activity.x),
                  mean)

#Calculate the colMeans and rowMeans 
colave <- colMeans(mergeDataAgg, na.rm=TRUE)
rowave <- rowMeans(mergeDataAgg, na.rm=TRUE)

#Assign names to newly created vaiable and observations
names(mergeDataAgg) [1] <- c("Activity")
rownames(mergeDataAgg) [1] <- c("Walking")
rownames(mergeDataAgg) [2] <- c("Walking Upstairs")
rownames(mergeDataAgg) [3] <- c("Walking Downstairs")
rownames(mergeDataAgg) [4] <- c("Sitting")
rownames(mergeDataAgg) [5] <- c("Standing")
rownames(mergeDataAgg) [6] <- c("Laying")

#Add the averages column to mergeDataAgg
mergeDataAggRow <- rbind(mergeDataAgg, colave)

#Add a cell to rowave to allow cbind
rowavespace <- c(0)
rowave2 <- c(rowave, rowavespace)
mergeDataAggComplete <- cbind(mergeDataAggRow, rowave2)

#Assign a name to the newly created row
rownames(mergeDataAggRow) [7] <- c("Average")


#Create groups of column names designating mean, sd, and ave
mean_colname <- c(3:5,43:45,83:85,123:125,163:165,203,216,229,242,255,
                  268:270,296:298,347:349,375:377,426:428,454:456,505,515,
                  518,528,531,541,544,554)
sd_colname <- c(6:8,46:47,86:88,126:128,166:168,204,217,230,243,256,
                271:273,350:352,429:431,506,519,532,545)

#Create mean and sd output files
projectmean <- sapply(mergeData[, mean_colname], FUN=mean, na.rm=TRUE)
projectSD <- sapply(mergeData[, sd_colname], FUN=sd, na.rm=TRUE)

head(projectmean)
head(projectSD)

#Write output file per project instructions
write.table(mergeDataAgg, "c:/rWork/projectAVE.txt",
            row.names=FALSE, col.names=FALSE)













