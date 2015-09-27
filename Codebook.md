## Output file variables
    subjectId (numeric) - The representation of the subject participating the test and training.
    activityName (char) - The name of the activity.
    featureId (numeric) - The Id of the feature/measure captured when performing an activity.
    average (numeric)   - The average value of the measure.

## Output file summary
        subjectId activityId activityName                                         featureId      value
     1:         1          1      WALKING                          tBodyAcceleration.Mean.X  0.2820216
     2:         1          1      WALKING                          tBodyAcceleration.Mean.X  0.2558408
     3:         1          1      WALKING                          tBodyAcceleration.Mean.X  0.2548672
     4:         1          1      WALKING                          tBodyAcceleration.Mean.X  0.3433705
     5:         1          1      WALKING                          tBodyAcceleration.Mean.X  0.2762397
    ---                                                                                               
679730:        30          6       LAYING fBodyBodyGyroscopeJerkMagnitude.StandardDeviation -0.9979687
679731:        30          6       LAYING fBodyBodyGyroscopeJerkMagnitude.StandardDeviation -0.9990995
679732:        30          6       LAYING fBodyBodyGyroscopeJerkMagnitude.StandardDeviation -0.9991540
679733:        30          6       LAYING fBodyBodyGyroscopeJerkMagnitude.StandardDeviation -0.9985502
679734:        30          6       LAYING fBodyBodyGyroscopeJerkMagnitude.StandardDeviation -0.9988617
> summary(dt)
   subjectId       activityId    activityName                                       featureId          value         
 Min.   : 1.00   Min.   :1.000   Length:679734      tBodyAcceleration.Mean.X             : 10299   Min.   :-1.00000  
 1st Qu.: 9.00   1st Qu.:2.000   Class :character   tBodyAcceleration.Mean.Y             : 10299   1st Qu.:-0.98122  
 Median :17.00   Median :4.000   Mode  :character   tBodyAcceleration.Mean.Z             : 10299   Median :-0.55219  
 Mean   :16.15   Mean   :3.625                      tBodyAcceleration.StandardDeviation.X: 10299   Mean   :-0.51134  
 3rd Qu.:24.00   3rd Qu.:5.000                      tBodyAcceleration.StandardDeviation.Y: 10299   3rd Qu.:-0.09971  
 Max.   :30.00   Max.   :6.000                      tBodyAcceleration.StandardDeviation.Z: 10299   Max.   : 1.00000  
                                                    (Other)                              :617940  
