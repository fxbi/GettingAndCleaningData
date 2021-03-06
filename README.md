The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## To create the project:
1. In RStudio ro RGui, change the run setwd to set the working directory (i.e., 
   the folder where these the R script file is saved).
2. Download unzip the the data file to the same working directory as the R script.
   Once unzipped the "UCI HAR Dataset" must be moved to the working directory.
   (Note the R script only downloads but does NOT unzip the data file so this
   must be done manually by the user.)
3. Download and open the R script run_analysis.R in RStudio.
4. Run the R script run_analysis.R. An output file Output.txt will be created.

## How run_analysis.R works?
The program perform the following main steps in sequence:

1. Loads required packages to be used for this project
   and set the data source URL and input file path.

2. Merges the training and the test sets to create one data set
   using rbind. The subjectMeasure and ActivityMeasure are
   combined with the measurement data set.

3. Only the mean and standard deviation wherever available are
   extracted for analysis.  Other data files in the Inertial 
   Signals folder are not being used for this purpose.

4. Creates an independent tidy data set with the average 
   of each variable for each activity and each subject.
