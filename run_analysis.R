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
names(mergeDataAgg) [1] <- c("Activity")
#names(mergeDataAgg) [2] <- c("Activity")
rownames(mergeDataAgg) [1] <- c("Walking")
rownames(mergeDataAgg) [2] <- c("Walking Upstairs")
rownames(mergeDataAgg) [3] <- c("Walking Downstairs")
rownames(mergeDataAgg) [4] <- c("Sitting")
rownames(mergeDataAgg) [5] <- c("Standing")
rownames(mergeDataAgg) [6] <- c("Laying")

#Create groups of column names designating mean, sd, and ave
mean_colname <- c(2:4,42:44,81:83,121:123,161:163,201,214,227,240,253,
                  266:268,294:296,345:347,373:375,424:426,452:454,503,513,
                  516,526,529,539,542,552)
sd_colname <- c(5:7,45:47,84:86,124:126,164:166,202,215,228,241,254,
                269:271,348:350,427:429,504,517,530,543)
ave_colname <- c(2:1123)

#Create mean, sd, and ave output files
projectmean <- sapply(mergeData[, mean_colname], FUN=mean, na.rm=TRUE)
projectSD <- sapply(mergeData[, sd_colname], FUN=sd, na.rm=TRUE)
#projectAVE <- sapply(mergeData[, ave_colname], FUN=mean, na.rm=TRUE)

head(projectmean)
head(projectSD)
#head(projectAVE)

#Write output file per project instructions
write.table(mergeDataAgg, "c:/rWork/projectAVE.txt",
            row.names=FALSE, col.names=FALSE)













