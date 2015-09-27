## Output file variables
    * subjectId (numeric) - The representation of the subject participating in the test and training.
    
    * activityName (char) - The name of the activity.
                            1 - WALKING
                            2 - WALKING_UPSTAIRS
                            3 - WALKING_DOWNSTAIRS
                            4 - SITTING
                            5 - STANDING
                            6 - LAYING
    
    * featureId (numeric) - The Id of the feature measured when performing an activity.
                            tBodyAcceleration.Mean.X
                            tBodyAcceleration.Mean.Y
                            tBodyAcceleration.Mean.Z
                            tBodyAcceleration.StandardDeviation.X
                            tBodyAcceleration.StandardDeviation.Y
                            tBodyAcceleration.StandardDeviation.Z
                            tGravityAcceleration.Mean.X
                            tGravityAcceleration.Mean.Y
                            tGravityAcceleration.Mean.Z
                            tGravityAcceleration.StandardDeviation.X
                            tGravityAcceleration.StandardDeviation.Y
                            tGravityAcceleration.StandardDeviation.Z
                            tBodyAccelerationJerk.Mean.X
                            tBodyAccelerationJerk.Mean.Y
                            tBodyAccelerationJerk.Mean.Z
                            tBodyAccelerationJerk.StandardDeviation.X
                            tBodyAccelerationJerk.StandardDeviation.Y
                            tBodyAccelerationJerk.StandardDeviation.Z
                            tBodyGyroscope.Mean.X
                            tBodyGyroscope.Mean.Y
                            tBodyGyroscope.Mean.Z
                            tBodyGyroscope.StandardDeviation.X
                            tBodyGyroscope.StandardDeviation.Y
                            tBodyGyroscope.StandardDeviation.Z
                            tBodyGyroscopeJerk.Mean.X
                            tBodyGyroscopeJerk.Mean.Y
                            tBodyGyroscopeJerk.Mean.Z
                            tBodyGyroscopeJerk.StandardDeviation.X
                            tBodyGyroscopeJerk.StandardDeviation.Y
                            tBodyGyroscopeJerk.StandardDeviation.Z
                            tBodyAccelerationMagnitude.Mean
                            tBodyAccelerationMagnitude.StandardDeviation
                            tGravityAccelerationMagnitude.Mean
                            tGravityAccelerationMagnitude.StandardDeviation
                            tBodyAccelerationJerkMagnitude.Mean
                            tBodyAccelerationJerkMagnitude.StandardDeviation
                            tBodyGyroscopeMagnitude.Mean
                            tBodyGyroscopeMagnitude.StandardDeviation
                            tBodyGyroscopeJerkMagnitude.Mean
                            tBodyGyroscopeJerkMagnitude.StandardDeviation
                            fBodyAcceleration.Mean.X
                            fBodyAcceleration.Mean.Y
                            fBodyAcceleration.Mean.Z
                            fBodyAcceleration.StandardDeviation.X
                            fBodyAcceleration.StandardDeviation.Y
                            fBodyAcceleration.StandardDeviation.Z
                            fBodyAccelerationJerk.Mean.X
                            fBodyAccelerationJerk.Mean.Y
                            fBodyAccelerationJerk.Mean.Z
                            fBodyAccelerationJerk.StandardDeviation.X
                            fBodyAccelerationJerk.StandardDeviation.Y
                            fBodyAccelerationJerk.StandardDeviation.Z
                            fBodyGyroscope.Mean.X
                            fBodyGyroscope.Mean.Y
                            fBodyGyroscope.Mean.Z
                            fBodyGyroscope.StandardDeviation.X
                            fBodyGyroscope.StandardDeviation.Y
                            fBodyGyroscope.StandardDeviation.Z
                            fBodyAccelerationMagnitude.Mean
                            fBodyAccelerationMagnitude.StandardDeviation
                            fBodyBodyAccelerationJerkMagnitude.Mean
                            fBodyBodyAccelerationJerkMagnitude.StandardDeviation
                            fBodyBodyGyroscopeMagnitude.Mean
                            fBodyBodyGyroscopeMagnitude.StandardDeviation
                            fBodyBodyGyroscopeJerkMagnitude.Mean
                            fBodyBodyGyroscopeJerkMagnitude.StandardDeviation
    
    * average (numeric)   - The average value of the measure.

## Output file summary
   subjectId       activityId    activityName                                       featureId          value         
 Min.   : 1.00   Min.   :1.000   Length:679734      tBodyAcceleration.Mean.X             : 10299   Min.   :-1.00000  
 1st Qu.: 9.00   1st Qu.:2.000   Class :character   tBodyAcceleration.Mean.Y             : 10299   1st Qu.:-0.98122  
 Median :17.00   Median :4.000   Mode  :character   tBodyAcceleration.Mean.Z             : 10299   Median :-0.55219  
 Mean   :16.15   Mean   :3.625                      tBodyAcceleration.StandardDeviation.X: 10299   Mean   :-0.51134  
 3rd Qu.:24.00   3rd Qu.:5.000                      tBodyAcceleration.StandardDeviation.Y: 10299   3rd Qu.:-0.09971  
 Max.   :30.00   Max.   :6.000                      tBodyAcceleration.StandardDeviation.Z: 10299   Max.   : 1.00000  
                                                    (Other)                              :617940   
## Output file dataset structure
Classes ‘data.table’ and 'data.frame':	679734 obs. of  5 variables:
 $ subjectId   : int  1 1 1 1 1 1 1 1 1 1 ...
 $ activityId  : int  1 1 1 1 1 1 1 1 1 1 ...
 $ activityName: chr  "WALKING" "WALKING" "WALKING" "WALKING" ...
 $ featureId   : Factor w/ 66 levels "tBodyAcceleration.Mean.X",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ value       : num  0.282 0.256 0.255 0.343 0.276 ...
