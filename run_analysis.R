# 0. Load required packages to be used for this project

packages <- c("data.table", "dplyr", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)

## Set file path
path <- getwd()
path

## Download the data file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "Dataset.zip"
if (!file.exists(path)) {
    dir.create(path)
}
download.file(url, file.path(path, f))


## Unzip the data file
## This is done manually but should be automated.

## Set the input path to point to UCI HAR Dataset
## where all other data files are located after it
## has been uncompressed.
dataFolder <- file.path(path, "UCI HAR Dataset")
## dataFileList <- list.files(dataFolder, recursive=TRUE)


# 1. Merges the training and the test sets to create one data set.

## Read subject measurements
dtSubjectMeasureTrain <- fread(file.path(dataFolder, "train", "subject_train.txt"))
dtSubjectMeasureTest  <- fread(file.path(dataFolder, "test" , "subject_test.txt" ))

## Combine the two data sets vertically
dtSubjectMeasure <- rbind(dtSubjectMeasureTrain, dtSubjectMeasureTest)

## Rename the column to a more descriptive label
setnames(dtSubjectMeasure, "V1", "subjectId")

## Ensure they have the same number of columns and the row counts add up
## dim(dtMeasuresTrain); dim(dtMeasuresTest); dim(dtMeasures)

## Read the measurements (fact table)
dfMeasuresTrain <- read.table(file.path(dataFolder,"train", "X_train.txt"))
dtMeasuresTrain <- data.table(dfMeasuresTrain)
dfMeasuresTest <- read.table(file.path(dataFolder,"test", "x_test.txt"))
dtMeasuresTest <- data.table(dfMeasuresTest)

## Combine the two data sets vertically
dtMeasures <- data.table(rbind(dfMeasuresTrain, dfMeasuresTest))

## Ensure they have the same number of columns and the row counts add up
## dim(dtMeasuresTrain); dim(dtMeasuresTest); dim(dtMeasures)

## Read the activity measurements (foreign key to activity)
## These files allow the measurement data set to be joined with
## the activity label file in Step 3.
dtActivityMeasureTrain <- fread(file.path(dataFolder, "train", "Y_train.txt"))
dtActivityMeasureTest  <- fread(file.path(dataFolder, "test", "Y_test.txt" ))

## Combine the two data sets vertically
dtActivityMeasure <- rbind(dtActivityMeasureTrain, dtActivityMeasureTest)

## Rename the column so it can be merged with the other data table by activityId
setnames(dtActivityMeasure, "V1", "activityId")

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

## Read the features file.
dtFeature <- fread(file.path(dataFolder,"features.txt"))
setnames(dtFeature, names(dtFeature), c("featureId", "featureName"))

## Create a vector of column Ids to match.
## the columns in the dtMeasure table.
dtFeature$measureColumnId <- dtFeature[, paste0("V", featureId)]

## The measurement data set has 561 columns across which 
## correspond to the full list of features (561 rows).
## Verify the column names are all matching
## all(names(dtMeasures) == dtFeature$featureColumnId)

## Apply filter to subset only measures of interest 
## with literals std() and mean().
regExp <- "mean\\(\\)|std\\(\\)"                    ## Set regexp for the measures of interest
dtFeature <- dtFeature[grep(regExp, featureName)]   ## Filter out only the measures of interest


# 3. Uses descriptive activity names to name the activities in the data set.

## Read the activity_labels.txt file
## The label is used as descriptive name to the measurements.
dtActivity <- fread(file.path(dataFolder,"activity_labels.txt"))

## Rename columns
setnames(dtActivity, names(dtActivity), c("activityId", "activityName"))
dtActivity


# 4. Appropriately labels the data set with descriptive variable names.

## Create a vector of friendly column names using
## a function with Tidy-data compliant naming convention.
GetFriendlyName <- function(x){
    y <- x
    y <- gsub("[-]", ".", y)                            ## Replace any hypen with dot
    y <- gsub("[Mm]ean\\(\\)", "Mean", y)               ## Replace mean() with Mean
    y <- gsub("[Ss]td\\(\\)", "StandardDeviation", y)   ## Replace std() with StdDev
    y <- gsub("[A]cc", "Acceleration", y)               ## Replace Acc with Acceleration
    y <- gsub("[G]yro", "Gyroscope", y)                 ## Replace Gyro with Gyroscope
    y <- gsub("[M]ag", "Magnitude", y)                  ## Replace Mag with Magnitude
    y
}
dtFeature$friendlyColumnName <- GetFriendlyName(dtFeature$featureName)

# Subset the columns based on the required features and 
# the corresponding measure column ID (e.g., V1, v2, V3, etc.)
# To avoid unnecessary column renaming, columns in
# dtMeasures should be subset first before applying 
# friendly names.
selected <- c(key(dtMeasures), dtFeature$measureColumnId)
dtSelectedMeasures <- dtMeasures[, selected, with = FALSE]

# Rename the column to a more descriptive label.
setnames(dtSelectedMeasures, dtFeature$featureColumnId, dtFeature$friendlyColumnName)
dtSelectedMeasures

# Create a combined measure data set (fact table) with
# the ActivityId and SubjectId as the foreign key.
ds <- cbind(cbind(dtSubjectMeasure, dtActivityMeasure), dtSelectedMeasures)

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

## Join the selected measures with dtActivity using the ActivityId
dt <- merge(ds, dtActivity, by="activityId", all.x=TRUE)

## Add activityName as a key.
setkey(dt, subjectId, activityId, activityName)

## Reshape the data set from wide format to narrow format.
## Current dt table is "pivoted" on feature measures
dt <- data.table(melt(dt, key(dt), variable.name="featureId"))

## Summarise data
grouped <- group_by(dt, subjectId, activityName, featureId)
ds2 <- summarise(grouped, average = mean(value))
ds2 <- arrange(ds2, subjectId, activityName, featureId)

## Save the ouptut the file
write.table(ds2, "Output.txt", row.name=FALSE)
