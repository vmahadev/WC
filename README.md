---
title: "README"
author: "V.Mahadev"
date: "Friday, August 22, 2014"
output: html_document
---

##Procedure Steps##

###Data Inspection###

Load all reference tables

#1. Activity Labels#
  a. Read Activity Labels from activity_labels.txt

```r
dfActivityLabels=read.table("data/activity_labels.txt",col.names=c("Code","Activity"));
nrow(dfActivityLabels)
```

```
## [1] 6
```
  
  b. Data Inspection :
      
    - Inspection Strategy   : Check whether it require any cleaning or modifications
    - Inspection Procedure  : Display the entire list or use View(list) as it is small list(use nrow)  

```r
print(dfActivityLabels)
```

```
##   Code           Activity
## 1    1            WALKING
## 2    2   WALKING_UPSTAIRS
## 3    3 WALKING_DOWNSTAIRS
## 4    4            SITTING
## 5    5           STANDING
## 6    6             LAYING
```
		- Observation     : Attributes naming conventions are clean and clear 
                          Dataset looks clean. Appropriate attribute names have been used
		- Action Strategy : Doesn't require any modifications/transformations
		- Action          : None
#2. Labelled Activity Extraction#

###STEP 2: Combine Labelled Activity from Training and Test set###

```r
  #2. Combine Labelled Activity from Training and Test set
  #a. Read Activity Labels from the Training
  yTrainingActivityLabels <- read.table('data/train/y_train.txt');

  #b. Read Subjects Activity Identity column  from Test set
  yTestActivityLabels <- read.table('data/test/y_test.txt');

  #c. Combine both Training and Test Activity Identity rows of the subjects
  #ActivityLabels <- rbind(yTrainingActivityLabels,yTestActivityLabels)
    ActivityLabels<- mapply(c,yTrainingActivityLabels,yTestActivityLabels)

  #d. Prepare Labelled Activity of the Subjects Column for the tidy dataset
  Activity<-factor(ActivityLabels,label=dfActivityLabels[,2])
```

#3. Features Extraction#

###STEP 3. Selection and Transformation of Features List###

	a. Read Features List from features.txt

```r
    dfFeatureList=read.table("data/features.txt",col.names=c("Code","Feature"))
```

	b.  Inspection of the list
		- Inspection Strategy : Check whether it require any cleaning or modifications
		- Inspection Procedure: 
			  - View list and scroll through all 561 

```r
head(dfFeatureList)
```

```
##   Code           Feature
## 1    1 tBodyAcc-mean()-X
## 2    2 tBodyAcc-mean()-Y
## 3    3 tBodyAcc-mean()-Z
## 4    4  tBodyAcc-std()-X
## 5    5  tBodyAcc-std()-Y
## 6    6  tBodyAcc-std()-Z
```

```r
summary(dfFeatureList)
```

```
##       Code                             Feature   
##  Min.   :  1   fBodyAcc-bandsEnergy()-1,16 :  3  
##  1st Qu.:141   fBodyAcc-bandsEnergy()-1,24 :  3  
##  Median :281   fBodyAcc-bandsEnergy()-1,8  :  3  
##  Mean   :281   fBodyAcc-bandsEnergy()-17,24:  3  
##  3rd Qu.:421   fBodyAcc-bandsEnergy()-17,32:  3  
##  Max.   :561   fBodyAcc-bandsEnergy()-25,32:  3  
##                (Other)                     :543
```

```r
#print(dfFeatureList)
#view(dfFeatureList)
```
    - Observation: Attributes naming conventions are clean and the same is usable
			     1. Some of the data values have () and some have ","
           2. This definitely needs modification and transformations because these feature values will be used as column names in the final dataset used for analysis.
           Pattern Type                           Occurences  regex
				1. tBodyAcc-mean()-X                    - Multiple
				2. tBodyAcc-arCoeff()-X,1               - Multiple
				3. tBodyAcc-correlation()-X,Y           - Multiple
				4. fBodyAcc-bandsEnergy()-1,8           - Multiple
				5. angle(tBodyAccJerkMean),gravityMean) - Single  

   		Action Strategy : Strategy for naming these variables
				1. Remove or replace "()" in all the values 
        2. Replace "," with more meaningful/appropriate letter or word
        3. Procedure should be reversible or have a mapping table(JIC)
   		
      Action :
           Pattern Type                           Occurences  regex             Replace With
				1. tBodyAcc-mean()-X             	    - Multiple       ()                   None
				2. tBodyAcc-arCoeff()-X,1		         - Multiple      -[A-Z](,)[0-9]         (_)
				3. tBodyAcc-correlation()-X,Y           - Multiple   [-][A-Z]{1}[,][A-Z]{1} (_)
				4. fBodyAcc-bandsEnergy()-1,8           - Multiple   [0-9]+(,)[0-9]+        (_)
				5. angle(tBodyAccJerkMean),gravityMean) - Single     Manual Removal         NOne
        
        - Test regex Patterns
 

```r
  l<-c("tBodyAcc-arCoeff()-X,1","tBodyAcc-correlation()-X,Y","fBodyAcc-bandsEnergy()-1,8","angle(tBodyAccJerkMean),gravityMean)")
  grepl("\\(|\\)",l)
```

```
## [1] TRUE TRUE TRUE TRUE
```

```r
  grepl("[0-9]+,[0-9]+",l)
```

```
## [1] FALSE FALSE  TRUE FALSE
```

```r
  grepl("-[A-Z],[0-9]",l)
```

```
## [1]  TRUE FALSE FALSE FALSE
```

```r
  grepl("[-][a-zA-Z][,][a-zA-Z]",l)
```

```
## [1] FALSE  TRUE FALSE FALSE
```

Though these functions returns values expected when run on the data frame failed to produce consistent behaviour hence used substitue functions 


```r
#a. Transformation of Feature names
    #Remove open brackets
    dfModifiedFeatureList$Feature<-sub("\\(","",dfFeatureList$Feature)

    #Remove closing brackets
    dfModifiedFeatureList$Feature<-sub("\\)","",dfModifiedFeatureList$Feature)

    #Remove closing brackets
    dfModifiedFeatureList$Feature<-sub("\\)","",dfModifiedFeatureList$Feature)
    
    #Replace hyphen character with an underscore
    dfModifiedFeatureList$Feature<-sub("-","_",dfModifiedFeatureList$Feature)

    #Replace hyphen character with an underscore
    dfModifiedFeatureList$Feature<-sub("-","_",dfModifiedFeatureList$Feature)

    #Replace comma character with an underscore
    dfModifiedFeatureList$Feature<-sub(",","_",dfModifiedFeatureList$Feature)

    #verify
    #ifelse(length(levels(factor(dfModifiedFeatureList$Feature)))==length(levels(factor(dfFeatureList$Feature))),"Equal","Not Equal")

    #Substitute time domain t with TD
    dfModifiedFeatureList$Feature<-sub("tBody","TD_Body",dfModifiedFeatureList$Feature)
    
    #Substitute time domain t with TD
    dfModifiedFeatureList$Feature<-sub("tGravity","TD_Gravity",dfModifiedFeatureList$Feature)

    #Substitute freq domain f with FD
    dfModifiedFeatureList$Feature<-sub("fGravity","FD_Gravity",dfModifiedFeatureList$Feature)

    #Substitute freq domain f with FD
    dfModifiedFeatureList$Feature<-sub("fBody","FD_Body",dfModifiedFeatureList$Feature)

    #Substitute angle with Angle_
    dfModifiedFeatureList$Feature<-sub("angle","Angle_",dfModifiedFeatureList$Feature)

    #Not mandatory
    #convert all uppercase characters in the names to lowercase as per defn of tidy data
    dfModifiedFeatureList$Feature<-tolower(dfModifiedFeatureList$Feature)

  #b.Sorting 
    #Require sorting of code hence Sort using arrange 

    require(plyr)
```

```
## Loading required package: plyr
```

```
## Warning: package 'plyr' was built under R version 3.0.3
```

```r
    dfModifiedFeatureList<-arrange(dfModifiedFeatureList,Code)
```

#Selection of Measures#
###STEP 4:###
##To prepare the tidydata.txt for analysis##

As per the problem statement need to extract only standard and mean values of each measure (feature) and since its a three dimensional space movement and activity observation we need to have ***magnitude, angle and directions values***.

As per the technical specification documentation of sensor data capturing of Samsung S4 (At that point in time assuming Android OS is the only OS ported on Samsung S4) the following readings are captured

1. Accelerometer
2. Gyro

In addition to the above readings the anroid OS provides additional gravitational component measurements for corrections.

Considering the above points the following variables have been selected from the feature list. Frequency and time domain signals and computed features are dependent on the frequency components and hence mean frequecies have been included.

tBodyAcc      :1,2,3,4,5,6,     	        

tGravityAcc   :41,42,43,44,45,46 		    

tBodyAccJerk  :81,82,83,84,85,86 		    

tBodyGyro     :121,122,123,124,125,126

tBodyGryoJerk :161,162,163,164,165,166 	

tBodyAccMag   :201,202                 	

tGravityAccMag:214,215 			            

tBodyAccJerkMag: 227,228 			            

tBodyGyroMag:240,241				            

tBodyGyroJerkMag:253,254 			            

fBodyAcc:266,267,268,269,270,271 	

fBodyAccJerk-mean()-X :345,346,347,348,349,350 	

fBodyGyro-mean()-X: 424,425,426,427,428,429 	

fBodyAccMag-mean(): 503,504 			            

Angles: 555,556,557,558,559,560,561


```r
#c.Select Measures - Std and Means of Measures
  SelectedFieldsOfMeasurementMeanStdValues <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,
                                                121,122,123,124,125,126,161,162,163,164,165,166,
                                                201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,
                                                345,346,347,348,349,350,373,374,375,
                                                424,425,426,427,428,429,452,453,454,
                                                503,504,513,555,556,557,558,559,560,561)
    #removed 526,539,552
  #d. Extract names of Selected Measures (Means and Std plus Freq Component and Angle)
  FieldNames<-tolower(dfModifiedFeatureList[SelectedFieldsOfMeasurementMeanStdValues,2])

  #prepare column names for the final result set
  ColNames<-t(cbind(c("Subject","Activity",t(FieldNames))))
 
  ColNames
```

```
##      [,1]      [,2]       [,3]                [,4]               
## [1,] "Subject" "Activity" "td_bodyacc_mean_x" "td_bodyacc_mean_y"
##      [,5]                [,6]               [,7]              
## [1,] "td_bodyacc_mean_z" "td_bodyacc_std_x" "td_bodyacc_std_y"
##      [,8]               [,9]                   [,10]                 
## [1,] "td_bodyacc_std_z" "td_gravityacc_mean_x" "td_gravityacc_mean_y"
##      [,11]                  [,12]                 [,13]                
## [1,] "td_gravityacc_mean_z" "td_gravityacc_std_x" "td_gravityacc_std_y"
##      [,14]                 [,15]                   [,16]                  
## [1,] "td_gravityacc_std_z" "td_bodyaccjerk_mean_x" "td_bodyaccjerk_mean_y"
##      [,17]                   [,18]                  [,19]                 
## [1,] "td_bodyaccjerk_mean_z" "td_bodyaccjerk_std_x" "td_bodyaccjerk_std_y"
##      [,20]                  [,21]                [,22]               
## [1,] "td_bodyaccjerk_std_z" "td_bodygyro_mean_x" "td_bodygyro_mean_y"
##      [,23]                [,24]               [,25]              
## [1,] "td_bodygyro_mean_z" "td_bodygyro_std_x" "td_bodygyro_std_y"
##      [,26]               [,27]                    [,28]                   
## [1,] "td_bodygyro_std_z" "td_bodygyrojerk_mean_x" "td_bodygyrojerk_mean_y"
##      [,29]                    [,30]                  
## [1,] "td_bodygyrojerk_mean_z" "td_bodygyrojerk_std_x"
##      [,31]                   [,32]                   [,33]               
## [1,] "td_bodygyrojerk_std_y" "td_bodygyrojerk_std_z" "td_bodyaccmag_mean"
##      [,34]               [,35]                   [,36]                 
## [1,] "td_bodyaccmag_std" "td_gravityaccmag_mean" "td_gravityaccmag_std"
##      [,37]                    [,38]                  
## [1,] "td_bodyaccjerkmag_mean" "td_bodyaccjerkmag_std"
##      [,39]                 [,40]                [,41]                    
## [1,] "td_bodygyromag_mean" "td_bodygyromag_std" "td_bodygyrojerkmag_mean"
##      [,42]                    [,43]               [,44]              
## [1,] "td_bodygyrojerkmag_std" "fd_bodyacc_mean_x" "fd_bodyacc_mean_y"
##      [,45]               [,46]              [,47]             
## [1,] "fd_bodyacc_mean_z" "fd_bodyacc_std_x" "fd_bodyacc_std_y"
##      [,48]              [,49]                   [,50]                  
## [1,] "fd_bodyacc_std_z" "fd_bodyaccjerk_mean_x" "fd_bodyaccjerk_mean_y"
##      [,51]                   [,52]                  [,53]                 
## [1,] "fd_bodyaccjerk_mean_z" "fd_bodyaccjerk_std_x" "fd_bodyaccjerk_std_y"
##      [,54]                  [,55]                      
## [1,] "fd_bodyaccjerk_std_z" "fd_bodyaccjerk_meanfreq_x"
##      [,56]                       [,57]                      
## [1,] "fd_bodyaccjerk_meanfreq_y" "fd_bodyaccjerk_meanfreq_z"
##      [,58]                [,59]                [,60]               
## [1,] "fd_bodygyro_mean_x" "fd_bodygyro_mean_y" "fd_bodygyro_mean_z"
##      [,61]               [,62]               [,63]              
## [1,] "fd_bodygyro_std_x" "fd_bodygyro_std_y" "fd_bodygyro_std_z"
##      [,64]                    [,65]                   
## [1,] "fd_bodygyro_meanfreq_x" "fd_bodygyro_meanfreq_y"
##      [,66]                    [,67]                [,68]              
## [1,] "fd_bodygyro_meanfreq_z" "fd_bodyaccmag_mean" "fd_bodyaccmag_std"
##      [,69]                    [,70]                         
## [1,] "fd_bodyaccmag_meanfreq" "angle_td_bodyaccmean_gravity"
##      [,71]                                 
## [1,] "angle_td_bodyaccjerkmean_gravitymean"
##      [,72]                              
## [1,] "angle_td_bodygyromean_gravitymean"
##      [,73]                                   [,74]                
## [1,] "angle_td_bodygyrojerkmean_gravitymean" "angle_x_gravitymean"
##      [,75]                 [,76]                
## [1,] "angle_y_gravitymean" "angle_z_gravitymean"
```

Inspect the values

#5. Extract Subjects #
###STEP 5:Subjects Identity Column ###

```r
    #a.Read Subjects Identity Column from the Training Set
    SubjectsFromTainingSet<-read.table('data/train/subject_train.txt')

    #b. Read Subjects Identity Column from the Test Set
    SubjectsFromTestSet<-read.table('data/test/subject_test.txt')

    #c. Combine Subjects Identity Column of both Training and Test set 
    Subjects<-as.vector(c(SubjectsFromTainingSet,SubjectsFromTestSet,recursive=TRUE))
length(Subjects)
```

```
## [1] 10299
```

```r
levels(factor(Subjects))
```

```
##  [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14"
## [15] "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28"
## [29] "29" "30"
```

#6. Captured Sensor and Computed data extraction#
###STEP 6:Combine both Training and Test datasets###


```r
  #a. Read Captured Sensor and Computed data from the Training Set
  CapturedDataTrainingSet <- read.table('data/train/x_train.txt',)

  #b.Read Captured Sensor and Computed data from the Test Set
  CapturedDataTestSet <- read.table('data/test/x_test.txt')

  #c.Combine Captured Sensor and Computed data of both Trainig and The Test Set
  #CapturedDataCombined <- rbind(CapturedDataTrainingSet,CapturedDataTestSet)
  CapturedDataCombined <- mapply(c,CapturedDataTrainingSet,CapturedDataTestSet)
```

#6. Final Step - Merge -> Tidy Data#
### Combining 1. Subjects Identity Column###
###           2. Labled Activity Column  <- from (4.c)###
###           3. Captured and Computed Std and Means plus Angles and Freq Component Columns <- from (5.c)###
    

```r
  #a. Combine Subjects from Step 2, Labelled Activity from Step 1 and   
  WearableCompTidyDataset<-data.frame(Subjects,Activity,CapturedDataCombined[,SelectedFieldsOfMeasurementMeanStdValues])
  CapturedData<-CapturedDataCombined[,SelectedFieldsOfMeasurementMeanStdValues]
  WearableCompTidyDatasetV<-cbind(Subjects,Activity,CapturedData) 
  
  #b. Update Column names
  colnames(WearableCompTidyDataset)<-ColNames
```


# Write tidydata.txt file using write.table#

```r
  #.a Generate file name
    fileName<-paste0("tidyDataWC",format(Sys.time(),"%a_%Y_%b_%d_%H_%M_%S.txt"))  
 #.b write 
    #nCols <- ncol(WearableCompTidyDataset)
    #write(as.vector(WearableCompTidyDatasetV),file=fileName,ncolumns=nCols,sep=",")
    fileName<-paste0("tidyDataWC",format(Sys.time(),"%a_%Y_%b_%d_%H_%M_%S.txt"))  
    write.table(WearableCompTidyDataset,file=fileName,sep=",")
```




This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.
